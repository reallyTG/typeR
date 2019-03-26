library(rsimsum)


### Name: print.multisimsum
### Title: print.multisimsum
### Aliases: print.multisimsum

### ** Examples

data(frailty)
ms <- multisimsum(data = frailty, par = "par", true = c(trt = -0.50,
   fv = 0.75), estvarname = "b", se = "se", methodvar = "model",
   by = "fv_dist")
ms



