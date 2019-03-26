library(BIGL)

data("directAntivirals", package = "BIGL")
data <- subset(directAntivirals, experiment == 1)[, c("effect", "d1", "d2")]

transforms <- list(
  "BiolT" = function(y, args) with(args, N0*exp(y*time.hours)),
  "InvBiolT" = function(T, args) with(args, 1/time.hours*log(T/N0)),
  "PowerT" = function(y, args) with(args, log(y)),
  "InvPowerT" = function(T, args) with(args, exp(T)),
  "compositeArgs" = list("N0" = 1,
                         "time.hours" = 72)
)

## Initial parameters for estimation without transformations
initPars <- initialMarginal(data)
initPars <- initPars + seq(0, 1, length.out = 7)

## Initial parameters for estimations with transformations
initParsT <- initialMarginal(data, transforms = transforms)
initParsT <- initParsT + c(-0.1, 0.2, 0.3, 0.4, 0.6, -0.4, 0.3)

names(initPars) <- names(initParsT) <- c("h1", "h2", "b", "m1", "m2", "e1", "e2")
