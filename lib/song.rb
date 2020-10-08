require 'pry'
class Song
  
  attr_accessor :name, :artist_name

  @@all = []


  def self.all
    @@all
  end

  def self.all=(new_all)
    @@all = new_all
  end

  def initialize(title = nil, artist = nil)
    self.save
    @name = title
    @artist_name = artist
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  # Song Class Methods .create instantiates and saves the song, and it returns the new song that was created

  def self.create
    self.new
  end 

  # Song Class Methods .new_by_name instantiates a song with a name property

  def self.new_by_name(song_title)
    self.new(song_title)
  end

  # Song Class Methods .create_by_name instantiates and saves a song with a name property

  def self.create_by_name(song_title)
    self.new(song_title)
  end

  # Song Class Methods .find_by_name can find a song present in @@all by name
  def self.find_by_name(song_name)
    self.all.find { |element| element.name == song_name }    
  end

  def self.find_or_create_by_name(song_name)
    find = self.find_by_name(song_name)
    find ? find : self.create_by_name(song_name)
  end

  # Song Class Methods .alphabetical returns all the song instances in alphabetical order by song name
  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  # Song Class Methods .new_from_filename initializes a song and artist_name based on the filename format
  def self.new_from_filename(file_name)
    artist_and_song = file_name.split(/\.| - /)
    self.new(artist_and_song[1], artist_and_song[0])
  end

  def self.create_from_filename(file_name)
    artist_and_song = file_name.split(/\.| - /)
    self.new(artist_and_song[1], artist_and_song[0])
  end

  def self.destroy_all
    self.all = []
  end
end