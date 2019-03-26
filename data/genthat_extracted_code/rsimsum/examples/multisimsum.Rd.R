library(rsimsum)


### Name: multisimsum
### Title: Analyses of simulation studies with multiple estimands at once,
###   including Monte Carlo error
### Aliases: multisimsum

### ** Examples

data("frailty", package = "rsimsum")
ms <- multisimsum(data = frailty, par = "par", true = c(trt = -0.50,
   fv = 0.75), estvarname = "b", se = "se", methodvar = "model",
   by = "fv_dist")
ms



