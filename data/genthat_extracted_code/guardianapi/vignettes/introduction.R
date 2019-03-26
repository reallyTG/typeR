## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

options("gu.API.key" = "test")

## ----logan-example, message=FALSE----------------------------------------
library(guardianapi)
library(dplyr)
library(lubridate)
library(ggplot2)

logan_search <- gu_items(query = "profile/brianlogan")

logan_search$star_rating <- as.numeric(logan_search$star_rating)

logan_reviews <- logan_search %>% 
  filter(!is.na(star_rating), 
         web_publication_date >= as.Date("2002-01-01"),
         web_publication_date <= as.Date("2018-12-31"))

logan_reviews$year <- as.factor(year(logan_reviews$web_publication_date))

logan_summary <- logan_reviews %>%
  group_by(year, star_rating) %>%
  summarise(count = n()) %>%
  mutate(perc = count/sum(count)) %>%
  ungroup() %>%
  mutate(star_rating = factor(star_rating, levels = c(5,4,3,2,1)))

p_logan <- ggplot(data = logan_summary,
                  aes(x = year, y = count, group = star_rating)) + 
  geom_line(aes(colour = star_rating)) + 
  scale_colour_viridis_d()

p_logan


## ----logan-area-plot, message=FALSE--------------------------------------
p_logan_area <- ggplot(data = logan_summary,
                  aes(x = year, y = perc, group = star_rating)) + 
  geom_area(aes(fill = star_rating)) + 
  scale_fill_viridis_d() + 
  scale_y_continuous(labels = scales::percent)

p_logan_area

## ----bradshaw-example, message=FALSE-------------------------------------
library(dplyr)
library(lubridate)
library(ggplot2)

bradshaw_search <- gu_items(query = "profile/peterbradshaw")

bradshaw_search$star_rating <- as.numeric(bradshaw_search$star_rating)

bradshaw_reviews <- bradshaw_search %>% 
  filter(!is.na(star_rating), star_rating != 0,
         web_publication_date >= as.Date("2002-01-01"),
         web_publication_date <= as.Date("2018-12-31"))

bradshaw_reviews$year <- as.factor(year(bradshaw_reviews$web_publication_date))

bradshaw_summary <- bradshaw_reviews %>%
  group_by(year, star_rating) %>%
  summarise(count = n()) %>%
  mutate(perc = count/sum(count)) %>%
  ungroup() %>%
  mutate(star_rating = factor(star_rating, levels = c(5,4,3,2,1)))

p_bradshaw <- ggplot(data = bradshaw_summary,
                  aes(x = year, y = count, group = star_rating)) + 
  geom_line(aes(colour = star_rating)) + 
  scale_colour_viridis_d()

p_bradshaw


## ----bradshaw-area, message=FALSE----------------------------------------
p_bradshaw_area <- ggplot(data = bradshaw_summary,
                  aes(x = year, y = perc, group = star_rating)) + 
  geom_area(aes(fill = star_rating)) + 
  scale_fill_viridis_d() + 
  scale_y_continuous(labels = scales::percent)

p_bradshaw_area

## ----comp-hist, message=FALSE--------------------------------------------

bradshaw_reviews$byline <- "Peter Bradshaw"

logan_reviews$byline <- "Brian Logan"

comp_df <- bind_rows(logan_reviews, bradshaw_reviews) %>%
  mutate(star_rating = as.numeric(star_rating))

comp_df2 <- comp_df %>%
  group_by(star_rating, byline) %>%
  summarise(count = n()) %>% group_by(byline) %>%
  mutate(perc = count/sum(count))


comp_p <- ggplot(comp_df, 
                 aes(x = star_rating, y = ..density.., fill = byline)) + 
  geom_histogram(position="dodge", bins = 5, alpha = 0.5) +
  scale_y_continuous(labels = scales::percent) +
  scale_fill_viridis_d(end = 0.9, option = "inferno") + 
  labs(x = "Star Rating", y = "", fill = "") + 
  theme(legend.position = "bottom") +
  geom_line(aes(x = star_rating, y = perc,
                colour = byline, group = byline), data = comp_df2,
            size = 1) + 
  scale_colour_viridis_d(end = 0.9, option = "inferno")  +
  guides(colour = FALSE)

comp_p

## ----relationships-demo, message=FALSE-----------------------------------
relations <- gu_content(query = "relationships", from_date = "2018-11-30",
                        to_date = "2018-12-30")

tibble::glimpse(relations)


## ------------------------------------------------------------------------
relations_sex <- gu_content(query = "relationships", from_date = "2018-11-30",
                            to_date = "2018-12-30", tag = "lifeandstyle/sex")

tibble::glimpse(relations_sex)

