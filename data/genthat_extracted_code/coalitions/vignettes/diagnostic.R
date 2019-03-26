## ---- echo = FALSE-------------------------------------------------------
library(knitr)
opts_chunk$set(
  fig.align  = "center",
  fig.width  = 4,
  fig.height = 4,
  crop       = TRUE)

## ----message=FALSE, warning=FALSE----------------------------------------
library(magrittr)
library(tidyr)
library(purrr)
library(dplyr)
library(coalitions)
library(ggplot2)
theme_set(theme_bw())

## ------------------------------------------------------------------------
temp <- scrape_wahlrecht() %>% slice(1) %>% collapse_parties() %>% unnest()
temp %<>%
	mutate(
		respondents = 1000L,
		percent  = c(36, 28, 7, 6, 9, 9, 5),
		votes    = respondents * percent/100) %>%
	nest(party:votes, .key=survey)

set.seed(29072017)
draws <- map(temp$survey, draw_from_posterior, nsim=1e4, correction=0.01) %>%
	flatten_df()
	draws_long <- gather(draws, party, percent, cdu:others) %>%
		group_by(party) %>%
		mutate(sim = row_number()) %>% ungroup()

## ---- fig.width=6, fig.height=6------------------------------------------
ggplot(draws_long, aes(x=party, y=percent)) +
	geom_boxplot() +
	geom_hline(yintercept = 0.05, lty=2, col=2)

## chains
ggplot(draws_long, aes(x=sim, y=percent)) +
	geom_path() +
	geom_hline(yintercept = 0.05, lty=2, col=2) +
	facet_wrap(~party, nrow=2)

draws_long %>%
	group_by(party) %>%
	summarize(entryprob = sum(percent >= 0.05)/n())

