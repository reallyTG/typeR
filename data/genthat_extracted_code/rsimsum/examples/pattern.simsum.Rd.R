library(rsimsum)


### Name: pattern.simsum
### Title: pattern method for simsum objects
### Aliases: pattern.simsum

### ** Examples

library(rsimsum)
library(ggplot2)
data("relhaz", package = "rsimsum")
s <- simsum(data = relhaz, estvarname = "theta", true = -0.5, se = "se",
  methodvar = "model", by = c("n", "baseline"), x = TRUE)
pattern(s)



