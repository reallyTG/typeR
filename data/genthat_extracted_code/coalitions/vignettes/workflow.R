## ---- echo = FALSE-------------------------------------------------------
library(knitr)
opts_chunk$set(
  fig.align  = "center",
  fig.width  = 4,
  fig.height = 4,
  warning    = FALSE,
  crop       = TRUE)

## ----message=FALSE, warning=FALSE----------------------------------------
library(tidyr)
library(purrr)
library(dplyr)
library(coalitions)

## ------------------------------------------------------------------------
# one line per survey (party information in wide format)
emnid <- scrape_wahlrecht() %>% slice(1:6)
emnid %>% select(-start, -end)

## ------------------------------------------------------------------------
elong <- collapse_parties(emnid)
head(elong)
elong %>% slice(1) %>% select(survey) %>% unnest()

## ------------------------------------------------------------------------
set.seed(1)     # for reproducibility

elong <- elong %>%
  mutate(draws = map(survey, draw_from_posterior, nsim=10, correction=0.005))
elong %>% select(date, survey, draws)
# each row is one election simulation
elong %>% slice(1) %>% select(draws) %>% unnest()

## ------------------------------------------------------------------------
elong <- elong %>%
  mutate(seats = map2(draws, survey, get_seats, distrib.fun=sls))
elong %>% select(date, survey, draws, seats)
## sim column indicates simulated elections (rows in draws column)
elong %>% slice(1) %>% select(seats) %>% unnest()

## ------------------------------------------------------------------------
coalitions <- list(
	c("cdu"),
	c("cdu", "fdp"),
	c("cdu", "greens"),
	c("cdu", "fdp", "greens"),
	c("spd"),
	c("spd", "left"),
	c("spd", "greens"),
	c("spd", "left", "greens"),
	c("cdu", "spd"))


elong <- elong %>%
	mutate(majorities = map(seats, have_majority, coalitions=coalitions))
elong %>% select(date, draws, seats, majorities)
# The majorities table for each date will have 1 row per simulation
# and one column per coalition
elong %>% slice(1) %>% select(majorities) %>% unnest()

## ------------------------------------------------------------------------
elong <- elong %>%
	mutate(
		probabilities = map(majorities, calculate_probs, coalitions=coalitions))
elong %>% select(date, majorities, probabilities)
# one row per coalition
elong %>% slice(1) %>% select(probabilities) %>% unnest()

## ------------------------------------------------------------------------
elong <- collapse_parties(emnid)
elong %>% get_probabilities(., nsim=10) %>% unnest()

