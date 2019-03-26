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

fit <- fitMarginals(data, transforms = transforms, method = "nlslm")

offAxis <- predictOffAxis(data, fit)
reps <- aggregate(effect ~ d1 + d2,
                  data = offAxis$offaxisZTable, length)[["effect"]]
R <- aggregate(effect - predicted ~ d1 + d2,
               data = offAxis$offaxisZTable, mean)[["effect - predicted"]]

rs <- fitSurface(data, fit, transforms = transforms,
                 B.CP = 2, B.B = NULL, parallel = FALSE,
                 statistic = "both")

offAxisTable <- aggregate(effect - predicted ~ d1 + d2,
                          rs$offAxisTable, mean)
