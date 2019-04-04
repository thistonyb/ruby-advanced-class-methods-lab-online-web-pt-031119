require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    return song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    return song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    song.save
    return song
  end

  def self.find_by_name(song_name)
    self.all.find{|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if song = self.find_by_name(song_name)
      return song
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    sorted = self.all.sort_by{|song| song.name}
    return sorted
  end

  def self.new_from_filename(file)
    info = file.split(/\s*[-\.]\s*/)
    song = self.new
    song.artist_name = info[0]
    song.name = info[1]
    return song
  end

  def self.create_from_filename(file)
    song = self.new_from_filename(file)
    song.save
  end

  def self.destroy_all
    self.all.clear
  end
end
