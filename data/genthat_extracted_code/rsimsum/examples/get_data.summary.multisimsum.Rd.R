library(rsimsum)


### Name: get_data.summary.multisimsum
### Title: get_data.summary.multisimsum
### Aliases: get_data.summary.multisimsum

### ** Examples

data(frailty)
ms <- multisimsum(data = frailty, par = "par", true = c(trt = -0.50,
   fv = 0.75), estvarname = "b", se = "se", methodvar = "model",
   by = "fv_dist")
sms <- summary(ms)
get_data(sms)
get_data(sms, description = TRUE)



