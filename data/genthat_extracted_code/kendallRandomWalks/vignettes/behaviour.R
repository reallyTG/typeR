## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  warning = F, 
  message = F,
  collapse = TRUE,
  comment = "#>"
)

## ----sim-----------------------------------------------------------------
library(kendallRandomWalks)
library(dplyr)
library(ggplot2)
set.seed(17)
walks <- simulate_kendall_rw(1000, 1000, rnorm, 0.5, T)
walks2 <- simulate_kendall_rw(1000, 1000, rcauchy, 0.5, T)

## ----ex1-----------------------------------------------------------------
plot(walks, max_id = 1)
plot(walks2, max_id = 1)

## ----unique--------------------------------------------------------------
ggplot(summarise_kendall_rw(walks, n_distinct), aes(x = aggregated), color = "black") +
  theme_bw() +
  geom_density() +
  geom_density(data = summarise_kendall_rw(walks2, n_distinct), color = "blue") +
  ylab("Estimated density") +
  xlab("Number of unique values") +
  scale_color_discrete(guide = "legend")

## ----jumps---------------------------------------------------------------
diffs <- mutate_kendall_rw(walks, function(x) x - lag(x), F)
plot(diffs, max_id = 1)
diffs2 <- mutate_kendall_rw(walks2, function(x) x - lag(x), F)
plot(diffs2, max_id = 1)

## ----skoki_dlugosc-------------------------------------------------------
diffs3 <- mutate_kendall_rw(diffs, function(x) as.numeric(x != 0), F)
lengths <- diffs3$simulation %>%
  group_by(sim_id) %>%
  mutate(id = 1:n()) %>%
  filter(sim != 0) %>%
  mutate(previous = ifelse(is.na(lag(id)), 0, lag(id))) %>%
  mutate(length = id - previous)

diffs4 <- mutate_kendall_rw(diffs2, function(x) as.numeric(x != 0), F)
lengths2 <- diffs4$simulation %>%
  group_by(sim_id) %>%
  mutate(id = 1:n()) %>%
  filter(sim != 0) %>%
  mutate(previous = ifelse(is.na(lag(id)), 0, lag(id))) %>%
  mutate(length = id - previous)


ggplot(subset(lengths, sim_id < 5), 
       aes(x = length, fill = as.factor(sim_id), group = as.factor(sim_id))) +
  geom_density() +
  theme_bw() +
  ggtitle("Distribution of time with no state-change (by simulation)")
ggplot(lengths, aes(x = length)) +
  geom_density() +
  theme_bw() +
  xlab("Jump size") +
  ggtitle("Distribution of time with no state-change (aggregated)")
ggplot(lengths2, aes(x = length)) +
  geom_density() +
  theme_bw() +
  xlab("Jump size") +
  ggtitle("Distribution of time with no state-change (aggregated)")



ggplot(subset(lengths, sim_id < 10), aes(x = id, y = length, color = as.factor(sim_id))) +
  geom_point() +
  theme_bw() +
  geom_line() +
  guides(color = "none") +
  xlab("Time") +
  ylab("Jump size") +
  ggtitle("Time with no state-change in time")

