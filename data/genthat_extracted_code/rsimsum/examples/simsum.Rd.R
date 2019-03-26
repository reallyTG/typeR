library(rsimsum)


### Name: simsum
### Title: Analyses of simulation studies including Monte Carlo error
### Aliases: simsum

### ** Examples

data("MIsim")
s <- simsum(data = MIsim, estvarname = "b", true = 0.5, se = "se", methodvar = "method", ref = "CC")
# If `ref` is not specified, the reference method is inferred
s <- simsum(data = MIsim, estvarname = "b", true = 0.5, se = "se", methodvar = "method")



