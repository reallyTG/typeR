library(rsimsum)


### Name: print.summary.multisimsum
### Title: print.summary.multisimsum
### Aliases: print.summary.multisimsum

### ** Examples

data(frailty)
ms <- multisimsum(data = frailty, par = "par", true = c(trt = -0.50,
   fv = 0.75), estvarname = "b", se = "se", methodvar = "model",
   by = "fv_dist")
sms <- summary(ms)
sms



