## ----loading packages, warning = FALSE, message = FALSE------------------
library(rzeit2)
library(robotstxt)
library(stringr)
library(dplyr)
library(tidytext)
library(ggplot2)
library(ggthemes)

## ----loading meta data, eval = FALSE-------------------------------------
#  # load meta data
#  articles_merkel <- get_content_all("Merkel",
#                                     begin_date = "20180501",
#                                     end_date = "20180531")
#  
#  # extract urls
#  urls <- articles_merkel$content$href

## ----robotstxt-----------------------------------------------------------
robots <- robotstxt("https://zeit.de")
robots$permissions

## ----scrape articles, eval = FALSE---------------------------------------
#  # get article content
#  article_texts <- get_article_text(urls, timeout = 2)

## ---- eval = FALSE-------------------------------------------------------
#  # prepare data frame
#  articles <- data.frame(url = urls,
#                         text = article_texts,
#                         date = as.Date(articles_merkel$content$release_date),
#                         stringsAsFactors = F)
#  
#  # exclude premium content
#  articles <- articles %>%
#    filter(!str_detect(text, "ZEIT PLUS CONTENT"))
#  
#  # lazy loading german sentiment dictionary
#  data("senti_ws")
#  
#  # calculate the sentiment for each day
#  sentiment_example <- articles %>%
#    unnest_tokens(word, text) %>%
#    inner_join(senti_ws) %>%
#    group_by(url, date) %>%
#    summarise(score = sum(score))

## ----load dataset, echo=FALSE--------------------------------------------
data("sentiment_example")

## ----plot sentiment------------------------------------------------------
# calculate sentiment by day
sentiment <- sentiment_example %>% 
  group_by(date) %>% 
  summarise(sentiment = sum(score) / n())

# plot the sentiment by day
ggplot(sentiment, aes(date, sentiment)) +
  geom_point(pch = 1, col = "#3a9b96") +
  geom_line(col = "#3a9b96", alpha = .6) +
  geom_hline(yintercept = mean(sentiment$sentiment), col = "#4e4e4e") +
  annotate("text", x = as.Date("2018-05-30"), y = -.18, 
           label = sprintf("mean = %s", round(mean(sentiment$sentiment), 2)), col = "#4e4e4e") +
  theme_fivethirtyeight() +
  theme(axis.title = element_text(), axis.title.x = element_blank()) + ylab('Articles Sentiment')

