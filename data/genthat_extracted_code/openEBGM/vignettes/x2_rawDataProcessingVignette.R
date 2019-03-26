## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ---- echo = FALSE-------------------------------------------------------
library(openEBGM)
set.seed(5629404)
dat <- data.frame(var1 = c(sample(c("product_A", "product_B"), 16,
                                  replace = TRUE), "product_C"),
                  var2 = c(sample(c("event_1", "event_2"), 16, replace = TRUE), "event_1"))
                  #strat1 = sample(c("M", "F"), 17, replace = TRUE),
                  #strat2 = sample(c("age_cat1", "age_cat2"), 17, replace = TRUE))
dat$id <- 1:nrow(dat)

## ------------------------------------------------------------------------
dat

## ------------------------------------------------------------------------
processRaw(data = dat, stratify = FALSE, zeroes = FALSE)

## ---- echo = FALSE-------------------------------------------------------
set.seed(5629404)
dat <- data.frame(var1 = c(sample(c("product_A", "product_B"), 16,
                                  replace = TRUE), "product_C"),
                  var2 = c(sample(c("event_1", "event_2"), 16, replace = TRUE), "event_1"),
                  strat1 = sample(c("M", "F"), 17, replace = TRUE),
                  strat2 = sample(c("age_cat1", "age_cat2"), 17, replace = TRUE))
dat$id <- 1:nrow(dat)

## ------------------------------------------------------------------------
dat

## ------------------------------------------------------------------------
processRaw(data = dat, stratify = TRUE, zeroes = FALSE)

## ------------------------------------------------------------------------
processRaw(data = dat, stratify = FALSE, zeroes = TRUE)

