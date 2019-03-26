## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(fig.width = 6)

## ------------------------------------------------------------------------
library(wikisourcer)

wikisource_book("https://en.wikisource.org/wiki/Candide")

## ------------------------------------------------------------------------
library(purrr)

fr <- "https://fr.wikisource.org/wiki/Candide,_ou_l%E2%80%99Optimisme/Garnier_1877"
en <- "https://en.wikisource.org/wiki/Candide"
es <- "https://es.wikisource.org/wiki/C%C3%A1ndido,_o_el_optimismo"
it <- "https://it.wikisource.org/wiki/Candido"
urls <- c(fr, en, es, it)

candide <- purrr::map_df(urls, wikisource_book)

## ----message=FALSE-------------------------------------------------------
library(stringr)
library(dplyr)

candide_cleaned <- candide %>%
  filter(!str_detect(text, "CHAPITRE|↑")) %>% #clean French
  filter(!str_detect(text, "CAPITULO")) %>% #clean Spanish
  filter(!str_detect(text, "../|IncludiIntestazione|Romanzi|^\\d+")) #clean Italian

## ----text_analysis-------------------------------------------------------
library(tidytext)
library(ggplot2)

candide_cleaned %>%
  tidytext::unnest_tokens(word, text) %>%
  count(page, language, sort = TRUE) %>%
  ggplot(aes(x = as.factor(page), y = n, fill = language)) +
    geom_col(position = "dodge") +
    theme_minimal() +
    labs(x = "chapter", y = "number of words",
         title = "Multilingual Text analysis of Voltaire's Candide")

## ------------------------------------------------------------------------
library(wikisourcer)

wikisource_page("https://en.wikisource.org/wiki/Sonnet_18_(Shakespeare)", "Sonnet 18")

## ------------------------------------------------------------------------
wikisource_book("https://en.wikisource.org/wiki/The_Sonnets")

## ------------------------------------------------------------------------
urls <- paste0("https://en.wikisource.org/wiki/Sonnet_", 1:154, "_(Shakespeare)") #154 urls

sonnets <- purrr::map2_df(urls, paste0("Sonnet ", 1:154), wikisource_page)
sonnets

## ----text_similarity, message=FALSE, warning=FALSE-----------------------
library(widyr)
library(SnowballC)
library(igraph)
library(ggraph)

sonnets_similarity <- sonnets %>%
  filter(!str_detect(text, "public domain|Public domain")) %>% #clean text
  tidytext::unnest_tokens(word, text) %>%
  anti_join(tidytext::get_stopwords("en")) %>%
  anti_join(data_frame(word = c("thy", "thou", "thee"))) %>% #old English stopwords
  mutate(wordStem = SnowballC::wordStem(word)) %>% #Stemming
  count(page, wordStem) %>%
  widyr::pairwise_similarity(page, wordStem, n) %>%
  filter(similarity > 0.3)

# themes by sonnet 
theme <- data_frame(page = unique(sonnets$page),
                    theme = c(rep("Procreation", times = 17), rep("Fair Youth", times = 60),
                              rep("Rival Poet", times = 9), rep("Fair Youth", times = 12),
                              rep("Irregular", times = 1), rep("Fair Youth", times = 26),
                              rep("Irregular", times = 1), rep("Dark Lady", times = 28))) %>%
  filter(page %in% sonnets_similarity$item1 |
         page %in% sonnets_similarity$item2)

set.seed(1234)

sonnets_similarity %>%
  graph_from_data_frame(vertices = theme) %>%
  ggraph() +
  geom_edge_link(aes(edge_alpha = similarity)) +
  geom_node_point(aes(color = theme), size = 3) +
  geom_node_text(aes(label = name), size = 3.5, check_overlap = TRUE, vjust = 1) +
  theme_void() +
  labs(title = "Closest Shakespeare's Sonnets to each others in terms of words used")


## ----sentiment_analysis, message=FALSE-----------------------------------
library(tidyr)

jane <- wikisource_book("https://en.wikisource.org/wiki/Pride_and_Prejudice")

jane_sent <- jane %>%
  unnest_tokens(word, text) %>%
  inner_join(get_sentiments("bing")) %>%
  anti_join(get_stopwords("en")) %>%
  count(page, sentiment) %>%
  spread(key = sentiment, value = n) %>%
  mutate(sentiment = positive - negative)

ggplot(jane_sent, aes(page, sentiment)) +
  geom_col() +
  geom_smooth(method = "loess", se = FALSE) +
  theme_minimal() +
  labs(title = "Sentiment analysis of “Pride and Prejudice”",
       subtitle = "Positive-negative words difference, by chapter",
       x = "chapter", y = "sentiment score")

