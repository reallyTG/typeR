## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ------------------------------------------------------------------------
library(nycflights13)
library(ranger)
library(cattonum)
suppressPackageStartupMessages(library(dplyr))

set.seed(4444)

data(flights)
str(flights)

## ------------------------------------------------------------------------
airlines_to_keep <- flights %>%
                      count(carrier) %>%
                      top_n(3, n) %>%
                      pull(carrier)

flights <- flights %>%
             filter(carrier %in% airlines_to_keep, dep_delay > 0) %>%
             select(-c(year, dep_time, sched_dep_time, arr_time, sched_arr_time,
                       arr_delay, flight, tailnum, time_hour))

## ------------------------------------------------------------------------
tot_mins <- 24 * 60

flights <- flights %>%
             mutate(min_of_day = 60 * hour + minute,
                    cos_min_of_day = cos(2 * pi * min_of_day / tot_mins),
                    sin_min_of_day = cos(2 * pi * min_of_day / tot_mins)) %>%
             select(-c(min_of_day, hour, minute)) %>%
             mutate(month = as.character(month),
                    day = as.character(day)) %>%
             filter(complete.cases(.))
str(flights)

## ---- eval = FALSE-------------------------------------------------------
#  catto_label(dat)
#  catto_label(dat, x1, x2)
#  catto_label(dat, c(x1, x2))
#  catto_label(dat, c("x1", "x2"))
#  catto_label(dat, one_of(c("x1", "x2"))) # one_of is exported by dplyr
#  catto_label(dat, one_of("x1", "x2"))

## ------------------------------------------------------------------------
label_encoded <- flights %>%
                   catto_label()
str(label_encoded)

mean_encoded <- flights %>%
                  catto_mean(response = dep_delay)
str(mean_encoded)

mix_encoded <- flights %>%
                 catto_freq(dest) %>%
                 catto_label(origin) %>%
                 catto_mean(response = dep_delay)
str(mix_encoded)

## ------------------------------------------------------------------------
encodings <- list(label = label_encoded,
                  mean = mean_encoded,
                  mix = mix_encoded)

get_oob_error <- function(dat) {
  rf <- ranger(data = as.data.frame(dat), # ranger can't handle tibbles
               num.trees = 100,
               dependent.variable.name = "dep_delay")
  rf$prediction.error
}

lapply(encodings, get_oob_error)

