require "yaml"


def load_library(file_path)
  emojis = YAML.load_file(file_path)
  emoji_list = {"get_emoticon" => {}, "get_meaning" => {}}
  emojis.each do |meaning, array|
    english, japanese = array
    emoji_list["get_emoticon"][english] = japanese
    emoji_list["get_meaning"][japanese] = meaning
  end
  emoji_list
end

def get_japanese_emoticon(file_path, emoji)
  emoticons = load_library(file_path)
  japanese = emoticons["get_emoticon"][emoji]
  if japanese
    japanese
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  emoticons = load_library(file_path)
  english = emoticons["get_meaning"][emoticon]
  if english
    english
  else
    "Sorry, that emoticon was not found"
  end
end
