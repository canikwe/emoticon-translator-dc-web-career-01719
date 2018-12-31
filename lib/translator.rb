require 'pry'
require 'yaml'

#binding.pry
def load_library(emoticons)
    emoticons = YAML.load_file('lib/emoticons.yml')
    
    emot_load = {}
    emot_load["get_emoticon"] = {}
    emot_load["get_meaning"] = {}
    
    emoticons.each do |meaning, emot_arr|
        emot_load["get_meaning"][emot_arr[1]] = meaning
        emot_load["get_emoticon"][emot_arr[0]] = emot_arr[1]

    end
    emot_load
end

def get_japanese_emoticon(file_path, emoticon)
    lib = load_library(file_path)
    jpn_emot_return = "Sorry, that emoticon was not found"
    
    lib["get_emoticon"].each do |emot_en, emot_jpn|
        if emot_en == emoticon
            jpn_emot_return = emot_jpn
#        elsif !lib["get_emoticon"].keys.include?(emot_en)
#            jpn_emot = "Sorry, that emoticon was not found" #I am not sure why this code did not update the jpn_emot_return variable, which was originally set to "". I ended up making a default message that would only update if the conditions in the iteration were met.
        end
    end
    jpn_emot_return
end

def get_english_meaning(file_path, emoticon)
    lib = load_library(file_path)
    en_meaning_return = "Sorry, that emoticon was not found"
    
    lib["get_meaning"].each do |emot_jpn, meaning|
        if emot_jpn == emoticon
            en_meaning_return = meaning
#        elsif !lib["get_meaning"].has_key?(emot_jpn)
#            en_meaning_return = "Sorry, that emoticon was not found" #tried a different method to search for the hash keys, but the en_meaning_return variable still would not update. Made a default message instead.
        end
    end
    en_meaning_return
end