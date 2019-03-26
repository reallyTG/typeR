library(vcd)


### Name: distplot
### Title: Diagnostic Distribution Plots
### Aliases: distplot
### Keywords: category

### ** Examples

## Simulated data examples:
dummy <- rnbinom(1000, size = 1.5, prob = 0.8)
distplot(dummy, type = "nbinomial")

## Real data examples:
data("HorseKicks")
data("Federalist")
data("Saxony")
distplot(HorseKicks, type = "poisson")
distplot(HorseKicks, type = "poisson", lambda = 0.61)
distplot(Federalist, type = "poisson")
distplot(Federalist, type = "nbinomial", size = 1)
distplot(Federalist, type = "nbinomial")
distplot(Saxony, type = "binomial", size = 12)



