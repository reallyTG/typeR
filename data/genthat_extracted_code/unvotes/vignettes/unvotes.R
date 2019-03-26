## ----echo = FALSE--------------------------------------------------------
knitr::opts_chunk$set(message = FALSE, warning = FALSE,
                      fig.height = 5, fig.width = 5)

## ------------------------------------------------------------------------
library(dplyr)
library(unvotes)

un_votes

## ------------------------------------------------------------------------
un_roll_calls

## ------------------------------------------------------------------------
un_roll_call_issues

library(dplyr)
count(un_roll_call_issues, issue, sort = TRUE)

## ----joined--------------------------------------------------------------
library(dplyr)

joined <- un_votes %>%
  inner_join(un_roll_calls, by = "rcid")

joined

## ----by_country_year, dependson = "joined"-------------------------------
library(lubridate)

by_country_year <- joined %>%
  group_by(year = year(date), country) %>%
  summarize(votes = n(),
            percent_yes = mean(vote == "yes"))

by_country_year

## ----by_country_year_plot, dependson = "by_country_year"-----------------
library(ggplot2)
theme_set(theme_bw())

countries <- c("United States of America", "United Kingdom of Great Britain and Northern Ireland", "India", "France")

# there were fewer votes in 2013
by_country_year %>%
  filter(country %in% countries, year <= 2013) %>%
  ggplot(aes(year, percent_yes, color = country)) +
  geom_line() +
  ylab("% of votes that are 'Yes'")

## ----issue_plot, dependson = "joined", fig.height = 8, fig.width = 8-----
joined %>%
  filter(country == "United States of America") %>%
  inner_join(un_roll_call_issues, by = "rcid") %>%
  group_by(year = year(date), issue) %>%
  summarize(votes = n(),
            percent_yes = mean(vote == "yes")) %>%
  filter(votes > 5) %>%
  ggplot(aes(year, percent_yes)) +
  geom_point() +
  geom_smooth(se = FALSE) +
  facet_wrap(~ issue)

