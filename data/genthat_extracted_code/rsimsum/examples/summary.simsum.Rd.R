library(rsimsum)


### Name: summary.simsum
### Title: Summarising simsum objects
### Aliases: summary.simsum

### ** Examples

data("MIsim")
object <- simsum(data = MIsim, estvarname = "b", true = 0.5, se = "se",
methodvar = "method", mcse = TRUE)
xs <- summary(object)
xs



