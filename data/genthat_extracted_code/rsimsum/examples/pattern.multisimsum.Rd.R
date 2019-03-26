library(rsimsum)


### Name: pattern.multisimsum
### Title: pattern method for multisimsum objects
### Aliases: pattern.multisimsum

### ** Examples

library(rsimsum)
library(ggplot2)
data("frailty", package = "rsimsum")
ms <- multisimsum(data = frailty, par = "par", true = c(trt = -0.50, fv = 0.75),
                    estvarname = "b", se = "se", methodvar = "model",
                    by = "fv_dist", x = TRUE)
pattern(ms)
pattern(ms, par = "trt")



