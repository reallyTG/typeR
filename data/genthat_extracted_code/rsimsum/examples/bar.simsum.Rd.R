library(rsimsum)


### Name: bar.simsum
### Title: bar method for simsum objects
### Aliases: bar.simsum

### ** Examples

library(rsimsum)
library(ggplot2)
data("relhaz", package = "rsimsum")
s <- simsum(data = relhaz, estvarname = "theta", true = -0.5, se = "se",
  methodvar = "model", by = c("n", "baseline"))
bar(s, sstat = "bias", by = c("n", "baseline"))



