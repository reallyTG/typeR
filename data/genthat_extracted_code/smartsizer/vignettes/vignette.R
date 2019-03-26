## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- message = FALSE, results = 'hide', include = FALSE-----------------
library("smartsizer")

## ------------------------------------------------------------------------
V1 <- diag(6)
V2 <- rbind(c(1, 0.2, 0, 0), c(0.2, 1, 0, 0), c(0 , 0, 1, 0.2), c(0, 0, 0.2, 1))

## ------------------------------------------------------------------------
Delta1 <- c(0, 0.5, 0.5, 0.5, 0.5, 0.5)
min_Delta1 <- 0.5

Delta2 <- c(0, 0.2, 0.3, 1.5)
min_Delta2 <- 0.2

## ------------------------------------------------------------------------
computePower(V1, Delta1, min_Delta1, alpha = 0.05, sample_size = 120)
computePower(V2, Delta2, min_Delta2, alpha = 0.05, sample_size = 250)

## ------------------------------------------------------------------------
V1 <- diag(6)
V2 <- rbind(c(1, 0.2, 0, 0), c(0.2, 1, 0, 0), c(0 , 0, 1, 0.2), c(0, 0, 0.2, 1))

## ------------------------------------------------------------------------
Delta1 <- c(0, 0.5, 0.5, 0.5, 0.5, 0.5)
min_Delta1 <- 0.5

Delta2 <- c(0, 0.2, 0.3, 1.5)
min_Delta2 <- 0.2

## ------------------------------------------------------------------------
computeSampleSize(V1, Delta1, min_Delta1, alpha = 0.05, desired_power = 0.8)
computeSampleSize(V2, Delta2, min_Delta2, alpha = 0.05, desired_power = 0.8)

## ------------------------------------------------------------------------
computePowerBySampleSize(V1, Delta1, min_Delta1, alpha = 0.05, sample_size_grid = seq(50, 200, 25))
computePowerBySampleSize(V2, Delta2, min_Delta2, alpha = 0.05, sample_size_grid = seq(50, 500, 50))

## ---- fig.width = 5, fig.height = 5--------------------------------------
plotPowerByN(V1, Delta1, min_Delta1, alpha = 0.05, sample_size_grid = seq(50, 200, 25), color = "black")

## ---- fig.width = 5, fig.height = 5--------------------------------------
plotPowerByN(V2, Delta2, min_Delta2, alpha = 0.05, sample_size_grid = seq(50, 500, 50), color = "blue")

