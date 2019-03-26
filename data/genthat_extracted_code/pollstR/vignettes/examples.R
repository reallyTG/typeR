## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----message=FALSE-------------------------------------------------------
library("pollstR")
library("ggplot2")
library("dplyr")
library("tidyr")
library("purrr")

## ----message=FALSE-------------------------------------------------------
slug <- "donald-trump-favorable-rating"
polls <- pollster_charts_polls(slug)[["content"]]
trendlines <- pollster_charts_trendlines(slug)[["content"]]

## ------------------------------------------------------------------------
.data <- gather(polls, response, value,
                Favorable, Unfavorable, Undecided) %>%
  mutate(value = if_else(is.na(value), 0, value))
ggplot() +
  geom_point(data = .data,
             aes(x = end_date, y = value, color = response),
             alpha = 0.5) +
  geom_smooth(data = .data, method = "loess", se = FALSE,
              aes(x = end_date, y = value, color = response))
  

## ------------------------------------------------------------------------
ggplot() +
  geom_point(data = .data,
             mapping = aes(x = end_date, y = value, color = response),
             alpha = 0.5) +
  geom_line(data = trendlines,
            mapping = aes(x = date, y = value, color = label), size = 1.5)

## ------------------------------------------------------------------------
ggplot(data = filter(.data, response == "Favorable"),
       mapping = aes(x = end_date, y = value, color = sample_subpopulation)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "loess", se = FALSE)

## ------------------------------------------------------------------------
questions <- pollster_questions()
questions$content$items[[1]]

## ------------------------------------------------------------------------
charts <- pollster_charts()
charts$content$items[[1]]

## ------------------------------------------------------------------------
polls <- pollster_polls()
polls$content$items[[1]]

## ------------------------------------------------------------------------
map_chr(pollster_tags()$content, "slug")

