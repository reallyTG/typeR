## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----message=FALSE-------------------------------------------------------
require(segmentr)
require(tidyr)
require(tibble)
require(dplyr)
require(lubridate)
require(magrittr)

## ------------------------------------------------------------------------
data(berlin)
berlin[, 1:5]

## ------------------------------------------------------------------------
berlin %>%
  colMeans() %>%
  enframe("time", "temperature") %>%
  mutate_at(vars(time), ymd) %>%
  with(plot(time, temperature, type="l"))

## ------------------------------------------------------------------------
lm_likelihood <- function (data) {
  as_tibble(t(data)) %>%
    rowid_to_column() %>%
    gather(station, temperature, -rowid) %>%
    with(lm(temperature ~ rowid)) %>%
    summary %>%
    .$adj.r.squared
}

c(lm_likelihood(berlin[, 2:3]), lm_likelihood(berlin[, 1:150]), lm_likelihood(berlin))

## ------------------------------------------------------------------------
f <- Vectorize(. %>% floor() %>% { berlin[, 1:.] } %>% lm_likelihood)
curve(f, from = 1, to = 730)

## ------------------------------------------------------------------------
penalized_likelihood <- auto_penalize(berlin, lm_likelihood)
f <- Vectorize(. %>% floor() %>% { berlin[, 1:.] } %>% penalized_likelihood)
curve(f, from = 1, to = 730)

## ------------------------------------------------------------------------
results <- segment(
  berlin,
  likelihood = penalized_likelihood,
  algorithm = "hierarchical"
)

results

## ------------------------------------------------------------------------
penalized_likelihood <- auto_penalize(berlin, lm_likelihood, big_segment_penalty = 10, small_segment_penalty = 1.1)

results <- segment(
  berlin,
  likelihood = penalized_likelihood,
  algorithm = "hierarchical"
)

results

## ------------------------------------------------------------------------
dates <- colnames(berlin) %>% ymd()

berlin %>%
  colMeans() %>%
  enframe("time", "temperature") %>%
  mutate_at(vars(time), ymd) %>%
  with({
    plot(time, temperature, type="l")
    abline(v=dates[results$changepoints], col="red", lty=2)
  })

## ------------------------------------------------------------------------
sub_berlin <- berlin[, 1:551]

results <- segment(
  sub_berlin,
  likelihood = penalized_likelihood,
  algorithm = "hierarchical"
)

results

## ------------------------------------------------------------------------
sub_berlin %>%
  colMeans() %>%
  enframe("time", "temperature") %>%
  mutate_at(vars(time), ymd) %>%
  with({
    plot(time, temperature, type="l")
    abline(v=dates[results$changepoints], col="red", lty=2)
  })

