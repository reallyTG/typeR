library(rsimsum)


### Name: summary.multisimsum
### Title: Summarising multisimsum objects
### Aliases: summary.multisimsum

### ** Examples

data(frailty)
ms <- multisimsum(data = frailty, par = "par", true = c(trt = -0.50,
   fv = 0.75), estvarname = "b", se = "se", methodvar = "model",
   by = "fv_dist")
sms <- summary(ms)
sms



