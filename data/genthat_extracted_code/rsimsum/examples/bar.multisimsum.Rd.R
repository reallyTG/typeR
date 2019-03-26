library(rsimsum)


### Name: bar.multisimsum
### Title: forest method for multisimsum objects
### Aliases: bar.multisimsum

### ** Examples

library(rsimsum)
library(ggplot2)
data("frailty", package = "rsimsum")
ms <- multisimsum(data = frailty, par = "par", true = c(trt = -0.50,
   fv = 0.75), estvarname = "b", se = "se", methodvar = "model",
   by = "fv_dist")
bar(ms, sstat = "bias", par = "trt", by = "fv_dist")



