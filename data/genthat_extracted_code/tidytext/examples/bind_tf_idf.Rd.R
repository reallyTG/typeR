library(tidytext)


### Name: bind_tf_idf
### Title: Bind the term frequency and inverse document frequency of a tidy
###   text dataset to the dataset
### Aliases: bind_tf_idf

### ** Examples


library(dplyr)
library(janeaustenr)

book_words <- austen_books() %>%
  unnest_tokens(word, text) %>%
  count(book, word, sort = TRUE)

book_words

# find the words most distinctive to each document
book_words %>%
  bind_tf_idf(word, book, n) %>%
  arrange(desc(tf_idf))




