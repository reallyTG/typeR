library(rriskDistributions)


### Name: rriskFitdist.perc
### Title: Fitting an amount of distribution families by given quantiles
### Aliases: rriskFitdist.perc
### Keywords: fitdistrplus

### ** Examples

fit.results1 <- rriskFitdist.perc(show.output = FALSE)
fit.results1

fit.results2 <- rriskFitdist.perc(show.output = FALSE, tolConv = 0.6)
fit.results2

p <- c(0.2, 0.7)
q <- c(2.6, 19.1)
fit.results3 <- rriskFitdist.perc(p = p, q = q, show.output = FALSE)
fit.results3

p <- c(0.3, 0.8, 0.9)
q <- c(10, 20, 40)
fit.results4 <- rriskFitdist.perc(p = p, q = q, show.output = FALSE)
fit.results4

## Example with fitted pert distribution
p <- c(0.025, 0.5, 0.6, 0.975)
q <- mc2d::qpert(p = p, min = 0, mode = 3, max = 10, shape = 5)
fit.results5 <- rriskFitdist.perc(p = p, q = q, show.output = FALSE)
fit.results5




