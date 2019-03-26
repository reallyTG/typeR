library(rsimsum)


### Name: heat.multisimsum
### Title: heat method for simsum objects
### Aliases: heat.multisimsum

### ** Examples

library(rsimsum)
library(ggplot2)
data("relhaz", package = "rsimsum")
s <- simsum(
  data = relhaz, estvarname = "theta", true = -0.5, se = "se",
  methodvar = "model", by = c("n", "baseline")
)
heat(s, sstat = "bias", y = "baseline")
library(rsimsum)
library(ggplot2)
data("frailty", package = "rsimsum")
ms <- multisimsum(data = frailty, par = "par", true = c(trt = -0.50,
   fv = 0.75), estvarname = "b", se = "se", methodvar = "model",
   by = "fv_dist")
heat(ms, sstat = "bias", par = "trt", y = "fv_dist", x = TRUE)



