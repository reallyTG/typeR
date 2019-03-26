library(rriskDistributions)


### Name: plotDiagnostics.perc
### Title: Graphical tools for choosing distribution by given quantiles
### Aliases: plotDiagnostics.perc
### Keywords: others

### ** Examples

p <- c(0.025, 0.5, 0.975)
q <- c(9.68, 29.20, 50.98)
fit.results1 <- rriskFitdist.perc(p = p, q = q, show.output = FALSE, tolConv = 0.5)
old.par <- graphics::par(mfrow = c(1, 2))
plotDiagnostics.perc(fit.results1)
plotDiagnostics.perc(fit.results1, tolPlot = 5)
graphics::par(old.par)

p <- c(0.2, 0.7)
q <- c(2.6, 19.1)
fit.results2 <- rriskFitdist.perc(p = p, q = q, show.output = FALSE)
plotDiagnostics.perc(fit.results2)

p <- c(0.3, 0.8, 0.9)
q <- c(10, 20, 40)
fit.results3 <- rriskFitdist.perc(p = p, q = q, show.output = FALSE)
plotDiagnostics.perc(fit.results3)

p <- c(0.3, 0.8, 0.9)
q <- c(10, 30, 40)
fit.results4 <- rriskFitdist.perc(p = p, q = q, show.output = FALSE)
plotDiagnostics.perc(fit.results4)

## Example with fitted beta pert distribution
p <- c(0.025, 0.5, 0.6, 0.975)
q <- mc2d::qpert(p = p, min = 0, mode = 3, max = 10, shape = 5)
fit.results5 <- rriskFitdist.perc(p = p, q = q, show.output = FALSE)
plotDiagnostics.perc(fit.results5)




