library(tidystopwords)


### Name: generate_stoplist
### Title: Listing of stop words with control over language and part of
###   speech.
### Aliases: generate_stoplist

### ** Examples

    # standard usage (might return some non-ASCII characters):
    generate_stoplist(lang_name = "English")
    
    # to get only conjunctions (11 items):
    generate_stoplist(lang_name = "English", 
                          stop_foreign_words = FALSE, 
                          stop_abbreviations = FALSE,
                          stop_pronominals = FALSE,
                          stop_determiners_quantifiers = FALSE,
                          stop_conjuctions = TRUE, 
                          stop_adpositions = FALSE,
                          stop_subordinating_conjunctions = FALSE,
                          stop_auxiliary_verbs = FALSE,
                          stop_interjections = FALSE,
                          stop_particles = FALSE,
                          stop_numerals = FALSE,
                          stop_symbols_crosslingual = FALSE,
                          stop_punctuation_crosslingual = FALSE)




