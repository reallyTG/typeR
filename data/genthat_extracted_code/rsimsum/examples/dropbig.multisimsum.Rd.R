library(rsimsum)


### Name: dropbig.multisimsum
### Title: Return observations dropped by simsum
### Aliases: dropbig.multisimsum

### ** Examples

data(frailty)
ms <- multisimsum(data = frailty, par = "par", true = c(trt = -0.50,
   fv = 0.75), estvarname = "b", se = "se", methodvar = "model",
   by = "fv_dist", dropbig = TRUE, max = 6, semax = 3)
dropbig(ms)



