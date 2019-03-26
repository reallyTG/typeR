## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(FSelectorRcpp)
data <- data.frame(
  y = factor(c("A", "A", "A", "B", "B", "A")),
  x = c(1.2, 2.1, 4.1, 7.3, 8.2, 3.2),
  z = c("x", "x", "y", "y", "y", "x"),
  stringsAsFactors = FALSE)
discretize(data, y ~ .)

## ------------------------------------------------------------------------
library(FSelectorRcpp)
data <- data.frame(
  y = factor(c("A", "A", "A", "B", "B", "A")),
  x = c(1.2, 2.1, 4.1, 7.3, 8.2, 3.2),
  z = c("x", "x", "y", "y", "y", "x"),
  int = as.integer(c(1, 1, 1, 2, 2, 1)),
  uniqueInt = as.integer(c(10, 20, 11, 22, 25, 11)),
  stringsAsFactors = FALSE)

# default (integers are discretized)
discretize(data, y ~ .)

# discIntegers is set to FALSE - integers are left as is.
discretize(data, y ~ ., discIntegers = FALSE)

## ------------------------------------------------------------------------
can_discretize <- function(x, treshold = 0.9) {
  
  is.integer(x) &&
  (length(unique(x)) / length(x) > treshold)
}

can_discretize(1:10)
can_discretize(rnorm(10))
can_discretize(as.integer(c(rep(1,10), rep(2, 10))))

library(dplyr)

set.seed(123)
dt <- data_frame(
  x = 1:20,
  y = rnorm(20),
  z = as.integer(c(rep(1,10), rep(2, 10)))
)

glimpse(dt)
glimpse(dt %>% mutate_if(can_discretize, as.numeric))

