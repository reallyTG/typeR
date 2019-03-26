## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----example1------------------------------------------------------------
# uzupelnic fig_captions, zeby dalo sie je zrobic
library(kendallRandomWalks)
kendall_rws <- simulate_kendall_rw(10, 100, runif, 0.25)
kendall_rws
plot(kendall_rws)
plot(simulate_kendall_rw(10, 100, rnorm, 0.76), level = 300)

## ----example1.1----------------------------------------------------------
kendall_rws_sym <- simulate_kendall_rw(10, 100, rnorm, 0.76, T)
kendall_rws_sym
plot(kendall_rws_sym)

## ----example2------------------------------------------------------------
kendall_rws2 <- simulate_kendall_rw(1000, 100, runif, 0.25)
ladder_moments <- ladder_moment(kendall_rws2, 1000)
ladder_moments
plot(ladder_moments)

ladder_heights <- ladder_height(kendall_rws2, 2000)
ladder_heights
plot(ladder_heights)

## ----example3------------------------------------------------------------
y <- seq(10, 10000, 50)
ladders <- sapply(y, 
                  function(x) 
                  ladder_moment_pmf(10, x, 0.5, pnorm, dnorm))
plot(y, ladders)

y <- seq(2000, 2200, 1)
plot(y, g_function(y, 0.1, dnorm))

plot(seq(0, 400, by = 1), g_function(seq(0, 400, by = 1), 0.5, dunif))

