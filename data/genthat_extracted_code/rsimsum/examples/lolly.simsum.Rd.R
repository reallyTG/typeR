library(rsimsum)


### Name: lolly.simsum
### Title: lolly method for simsum objects
### Aliases: lolly.simsum

### ** Examples

library(rsimsum)
library(ggplot2)
data("relhaz", package = "rsimsum")
s <- simsum(data = relhaz, estvarname = "theta", true = -0.5, se = "se",
  methodvar = "model", by = c("n", "baseline"))
lolly(s, sstat = "bias", by = c("n", "baseline"))



