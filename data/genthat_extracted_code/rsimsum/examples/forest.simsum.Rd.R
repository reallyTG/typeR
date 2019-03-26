library(rsimsum)


### Name: forest.simsum
### Title: forest method for simsum objects
### Aliases: forest.simsum

### ** Examples

library(rsimsum)
library(ggplot2)
data("relhaz", package = "rsimsum")
s <- simsum(data = relhaz, estvarname = "theta", true = -0.5, se = "se",
  methodvar = "model", by = c("n", "baseline"))
forest(s, sstat = "bias", by = c("n", "baseline"))



