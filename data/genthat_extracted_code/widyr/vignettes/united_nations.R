## ----setup, echo = FALSE----------------------------------------------------------------------------
library(knitr)

options(width = 102)
knitr::opts_chunk$set(message = FALSE, warning = FALSE)

library(ggplot2)
theme_set(theme_bw())

## ---------------------------------------------------------------------------------------------------
library(dplyr)
library(unvotes)

un_votes

## ---------------------------------------------------------------------------------------------------
levels(un_votes$vote)

## ----cors-------------------------------------------------------------------------------------------
library(widyr)

cors <- un_votes %>%
  mutate(vote = as.numeric(vote)) %>%
  pairwise_cor(country, rcid, vote, use = "pairwise.complete.obs", sort = TRUE)

cors

## ----US_cors----------------------------------------------------------------------------------------
US_cors <- cors %>%
  filter(item1 == "United States of America")

# Most in agreement
US_cors

# Least in agreement
US_cors %>%
  arrange(correlation)

## ----world_data-------------------------------------------------------------------------------------
library(maps)
library(fuzzyjoin)
library(countrycode)
library(ggplot2)

world_data <- map_data("world") %>%
  regex_full_join(iso3166, by = c("region" = "mapname")) %>%
  filter(region != "Antarctica")

## ----US_cors_map, fig.width = 6, fig.height = 6-----------------------------------------------------
US_cors %>%
  mutate(a2 = countrycode(item2, "country.name", "iso2c")) %>%
  full_join(world_data, by = "a2") %>%
  ggplot(aes(long, lat, group = group, fill = correlation)) +
  geom_polygon(color = "gray", size = .1) +
  scale_fill_gradient2() +
  coord_quickmap() +
  theme_void() +
  labs(title = "Correlation of each country's UN votes with the United States",
       subtitle = "Blue indicates agreement, red indicates disagreement",
       fill = "Correlation w/ US")

## ----country_network, fig.width = 6, fig.height = 6-------------------------------------------------
library(ggraph)
library(igraph)

cors_filtered <- cors %>%
  filter(correlation > .6)

continents <- data_frame(country = unique(un_votes$country)) %>%
  filter(country %in% cors_filtered$item1 |
         country %in% cors_filtered$item2) %>%
  mutate(continent = countrycode(country, "country.name", "continent"))

set.seed(2017)

cors_filtered %>%
  graph_from_data_frame(vertices = continents) %>%
  ggraph() +
  geom_edge_link(aes(edge_alpha = correlation)) +
  geom_node_point(aes(color = continent), size = 3) +
  geom_node_text(aes(label = name), check_overlap = TRUE, vjust = 1, hjust = 1) +
  theme_void() +
  labs(title = "Network of countries with correlated United Nations votes")

