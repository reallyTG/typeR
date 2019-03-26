## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(echo = TRUE)


## ----message = FALSE, warning = FALSE------------------------------------
library(dplyr)
library(tidystopwords)

## ------------------------------------------------------------------------
set.seed(111)
generate_stoplist() %>% sample(5)

## ------------------------------------------------------------------------
set.seed(6)
generate_stoplist(lang_name = "Spanish") %>% sample(5) 

## ------------------------------------------------------------------------
set.seed(23)
generate_stoplist(lang_name = c("Spanish", "German")) %>% sample(5)

## ------------------------------------------------------------------------
set.seed(26)
generate_stoplist(lang_name = "Spanish", lang_id = "es") %>% sample(5)

## ------------------------------------------------------------------------
set.seed(90)
generate_stoplist(lang_name = c("French", "Hungarian"), 
                  lang_id = c("sv", "hr")) %>% sample(20)

## ------------------------------------------------------------------------
list_supported_language_names() %>% head(5)

## ------------------------------------------------------------------------
list_supported_language_ids() %>% head(5)

## ------------------------------------------------------------------------
list_supported_pos()

## ----eval=FALSE----------------------------------------------------------
#  generate_stoplist(lang_name = "English", output_form = "data.frame") %>% slice(35) %>% glimpse()

## ------------------------------------------------------------------------
generate_stoplist(stop_foreign_words = FALSE, 
                  stop_abbreviations = FALSE,
                  stop_pronominals = FALSE,
                  stop_determiners_quantifiers = FALSE,
                  stop_conjuctions = FALSE, 
                  stop_adpositions = FALSE,
                  stop_subordinating_conjunctions = FALSE,
                  stop_auxiliary_verbs = FALSE,
                  stop_interjections = FALSE,
                  stop_particles = FALSE,
                  stop_numerals = FALSE,
                  stop_symbols_crosslingual = FALSE,
                  stop_punctuation_crosslingual = FALSE,
                  stop_lemmas = c("by"),
                  output_form = "data.frame") %>% 
  select(language_name, lemma, word_form) %>% distinct()

## ------------------------------------------------------------------------
generate_stoplist(lang_name = c("English", "Slovak"),
                  stop_foreign_words = FALSE, 
                  stop_abbreviations = FALSE,
                  stop_pronominals = FALSE,
                  stop_determiners_quantifiers = FALSE,
                  stop_conjuctions = FALSE, 
                  stop_adpositions = FALSE,
                  stop_subordinating_conjunctions = FALSE,
                  stop_auxiliary_verbs = FALSE,
                  stop_interjections = FALSE,
                  stop_particles = FALSE,
                  stop_numerals = FALSE,
                  stop_symbols_crosslingual = FALSE,
                  stop_punctuation_crosslingual = FALSE,
                  stop_lemmas = c("on", "a"),
                  output_form = "data.frame") %>% 
  select(language_name, lemma, word_form) %>% 
  apply(2,tolower) %>% as.data.frame() %>% distinct()

## ------------------------------------------------------------------------
generate_stoplist(lang_name = c("English", "Slovak"),
                  stop_foreign_words = FALSE, 
                  stop_abbreviations = FALSE,
                  stop_pronominals = FALSE,
                  stop_determiners_quantifiers = FALSE,
                  stop_conjuctions = FALSE, 
                  stop_adpositions = FALSE,
                  stop_subordinating_conjunctions = FALSE,
                  stop_auxiliary_verbs = FALSE,
                  stop_interjections = FALSE,
                  stop_particles = FALSE,
                  stop_numerals = FALSE,
                  stop_symbols_crosslingual = FALSE,
                  stop_punctuation_crosslingual = FALSE,
                  stop_forms = c("on", "a"),
                  output_form = "data.frame") %>% 
  select(language_name, lemma, word_form) %>% 
  apply(2,tolower) %>% as.data.frame() %>% distinct()

## ----eval=FALSE----------------------------------------------------------
#  generate_stoplist( stop_foreign_words = FALSE, stop_abbreviations = FALSE, stop_pronominals = FALSE, stop_determiners_quantifiers = FALSE, stop_conjuctions = FALSE, stop_adpositions = FALSE, stop_subordinating_conjunctions = FALSE, stop_auxiliary_verbs = FALSE, stop_interjections = FALSE, stop_particles = FALSE, stop_numerals = FALSE, stop_symbols_crosslingual = FALSE, stop_punctuation_crosslingual = FALSE, custom_filter = "POS == 'DET' & language_name == 'English'",output_form = "vector")

