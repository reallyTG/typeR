library(rsimsum)


### Name: zip.simsum
### Title: zip method for simsum objects
### Aliases: zip.simsum

### ** Examples

library(rsimsum)
library(ggplot2)
data("relhaz", package = "rsimsum")
s <- simsum(data = relhaz, estvarname = "theta", true = -0.5, se = "se",
  methodvar = "model", by = c("n", "baseline"), x = TRUE)
zip(s)
data("MIsim", package = "rsimsum")
s2 <- simsum(data = MIsim, estvarname = "b", true = 0.5, se = "se",
  methodvar = "method", x = TRUE)
zip(s2)



