library(ramps)


### Name: ramps.control
### Title: Auxiliary for Controlling georamps Model Fitting
### Aliases: ramps.control
### Keywords: models

### ** Examples

ctrl <- ramps.control(
   iter = seq(1, 100, by = 2),
   beta = param(rep(0, 2), "flat"),
   sigma2.e = param(rep(1, 2), "invgamma", shape = 2.0, scale = 0.1),
   phi = param(10, "uniform", min = 0, max = 100, tuning = 0.5),
   sigma2.z = param(1, "invgamma", shape = 2.0, scale = 0.1),
   file = c("params.txt", "z.txt")
)



