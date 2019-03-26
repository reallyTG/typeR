## ----echo = FALSE--------------------------------------------------------
knitr::opts_chunk$set(message = FALSE, warning = FALSE)

## ------------------------------------------------------------------------
library(gutenbergr)
gutenberg_metadata

## ------------------------------------------------------------------------
library(dplyr)

gutenberg_metadata %>%
  filter(title == "Wuthering Heights")

## ------------------------------------------------------------------------
gutenberg_works()

## ------------------------------------------------------------------------
gutenberg_works(author == "Austen, Jane")

# or with a regular expression

library(stringr)
gutenberg_works(str_detect(author, "Austen"))

## ------------------------------------------------------------------------
wuthering_heights <- gutenberg_download(768)

wuthering_heights

## ------------------------------------------------------------------------
books <- gutenberg_download(c(768, 1260), meta_fields = "title")

books

## ------------------------------------------------------------------------
books %>%
  count(title)

## ------------------------------------------------------------------------
gutenberg_subjects

## ------------------------------------------------------------------------
gutenberg_subjects %>%
  filter(subject == "Detective and mystery stories")

gutenberg_subjects %>%
  filter(grepl("Holmes, Sherlock", subject))

## ------------------------------------------------------------------------
gutenberg_authors

## ------------------------------------------------------------------------
library(tidytext)

words <- books %>%
  unnest_tokens(word, text)

words

word_counts <- words %>%
  anti_join(stop_words, by = "word") %>%
  count(title, word, sort = TRUE)

word_counts

