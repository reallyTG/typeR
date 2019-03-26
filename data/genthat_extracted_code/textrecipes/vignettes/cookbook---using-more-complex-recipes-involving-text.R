## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- message=FALSE------------------------------------------------------
library(dplyr)
library(recipes)
library(textrecipes)
data("okc_text")

## ------------------------------------------------------------------------
words <- c("you", "i", "sad", "happy")

okc_rec <- recipe(~ ., data = okc_text) %>%
  step_tokenize(essay0) %>%
  step_stopwords(essay0, custom_stopword_source = words, keep = TRUE) %>% 
  step_tf(essay0)

okc_obj <- okc_rec %>%
  prep(training = okc_text)
   
bake(okc_obj, okc_text) %>%
  select(starts_with("tf_essay0"))

## ------------------------------------------------------------------------
words <- c("sad", "happy")

okc_rec <- recipe(~ ., data = okc_text) %>%
  step_tokenize(essay0) %>%
  step_stopwords(essay0) %>% 
  step_stopwords(essay0, custom_stopword_source = words) %>% 
  step_tfidf(essay0)

okc_obj <- okc_rec %>%
  prep(training = okc_text)
   
bake(okc_obj, okc_text) %>%
  select(starts_with("tfidf_essay0"))

## ------------------------------------------------------------------------
okc_rec <- recipe(~ ., data = okc_text) %>%
  step_tokenize(essay0, token = "characters") %>%
  step_stopwords(essay0, custom_stopword_source = letters, keep = TRUE) %>%
  step_tf(essay0)

okc_obj <- okc_rec %>%
  prep(training = okc_text)
   
bake(okc_obj, okc_text) %>%
  select(starts_with("tf_essay0"))

## ------------------------------------------------------------------------
okc_rec <- recipe(~ ., data = okc_text) %>%
  step_tokenize(essay0, token = "words") %>%
  step_stem(essay0) %>%
  step_untokenize(essay0) %>%
  step_tokenize(essay0, token = "ngrams") %>%
  step_tokenfilter(essay0, max_tokens = 500) %>%
  step_tfidf(essay0)

okc_obj <- okc_rec %>%
  prep(training = okc_text)
   
bake(okc_obj, okc_text) %>%
  select(starts_with("tfidf_essay0"))

