library(rsimsum)


### Name: get_data.multisimsum
### Title: get_data.multisimsum
### Aliases: get_data.multisimsum

### ** Examples

data(frailty)
ms <- multisimsum(data = frailty, par = "par", true = c(trt = -0.50,
   fv = 0.75), estvarname = "b", se = "se", methodvar = "model",
   by = "fv_dist")
get_data(ms)
get_data(ms, description = TRUE)



