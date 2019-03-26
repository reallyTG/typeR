library(BIGL)

## Decreasing marginal curves
parsDec <- c("h1" = 2, "h2" = 2, "b" = 1,
             "m1" = 0, "m2" = 0, "e1" = log(0.8), "e2" = log(0.8))
## Increasing marginal curves
parsInc <- c("h1" = 2, "h2" = 2, "b" = 0,
             "m1" = 1, "m2" = 1, "e1" = log(0.8), "e2" = log(0.8))
## Diverging marginal curves
parsDiv <- c("h1" = 2, "h2" = 2, "b" = 0.5,
             "m1" = 0, "m2" = 1, "e1" = log(0.8), "e2" = log(0.8))

doseLevels <- seq(0, 1, length.out = 10)
doseGrid <- expand.grid(doseLevels, doseLevels)
colnames(doseGrid) <- c("d1", "d2")

## Generate some data based on provided marginal curves and
## a specified direction for synergy or antagonism.
genData <- function(pars, reps, mult = c(1, -1)) {

  ## Create a `MarginalFit`-like object
  fitResult <- list("coef" = pars,
                    "sigma" = 0.1,
                    "shared_asymptote" = FALSE,
                    "df" = nrow(doseGrid) * reps - length(pars),
                    "method" = "nlslm")
  class(fitResult) <- append(class(fitResult), "MarginalFit")

  data <- data.frame(doseGrid, "effect" = rep(NA, nrow(doseGrid)))

  d1null <- data$d1 == 0
  d2null <- data$d2 == 0
  one_null <- d1null | d2null

  data$effect[d1null & d2null] <- pars["b"]
  ## Compute values for marginal observations
  data$effect[d2null] <- L4(data$d1[d2null],
                            pars["h1"], pars["b"], pars["m1"], pars["e1"])

  data$effect[d1null] <- L4(data$d2[d1null],
                            pars["h2"], pars["b"], pars["m2"], pars["e2"])

  pred <- predictOffAxis(data, fitResult)$offaxisZTable
  data$effect[!one_null] <- pred$predicted

  ## Create some replicates
  data <- data[rep(row.names(data), reps), ]
  ## Add noise to data and synergistic/antagonistic effect to off-axis
  data$effect[!one_null] <- data$effect[!one_null] +
    mult * rnorm(sum(!one_null), 0.3, 0.1)

  return(list("data" = data, "pars" = fitResult))
}

