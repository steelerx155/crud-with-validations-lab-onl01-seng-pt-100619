class Song < ApplicationRecord
    belongs_to :artist
    validates :title, presence: true 
    validates :artist_name, presence: true 
    validates :released, inclusion: {in: [true, false] }
    validates :title, uniqueness: { scope: [:release_year, :artist_name] }



  
    with_options if: :released? do |song| 
        song.validates :release_year, presence: true
        song.validates :release_year, numericality: { less_than_or_equal_to: Time.now.year }
    end

    def released?
        released
    end


end
