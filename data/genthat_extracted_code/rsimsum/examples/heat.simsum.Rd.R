library(rsimsum)


### Name: heat.simsum
### Title: heat method for simsum objects
### Aliases: heat.simsum

### ** Examples

library(rsimsum)
library(ggplot2)
data("relhaz", package = "rsimsum")
s <- simsum(
  data = relhaz, estvarname = "theta", true = -0.5, se = "se",
  methodvar = "model", by = c("n", "baseline")
)
heat(s, sstat = "bias", y = "baseline")
heat(s, sstat = "bias", y = "n", text = TRUE)



