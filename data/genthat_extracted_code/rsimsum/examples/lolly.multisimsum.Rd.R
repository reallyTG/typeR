library(rsimsum)


### Name: lolly.multisimsum
### Title: lolly method for multisimsum objects
### Aliases: lolly.multisimsum

### ** Examples

library(rsimsum)
library(ggplot2)
data("frailty", package = "rsimsum")
ms <- multisimsum(data = frailty, par = "par", true = c(trt = -0.50,
   fv = 0.75), estvarname = "b", se = "se", methodvar = "model",
   by = "fv_dist")
lolly(ms, sstat = "bias", par = "trt", by = "fv_dist")



