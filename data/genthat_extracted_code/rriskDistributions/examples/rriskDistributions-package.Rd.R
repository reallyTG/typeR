library(rriskDistributions)


### Name: rriskDistributions-package
### Title: Fitting distributions to given data or known quantiles
### Aliases: rriskDistributions-package rriskDistributions
### Keywords: package

### ** Examples

q <- stats::qweibull(p = c(0.025, 0.5, 0.975), shape = 2, scale = 3)
get.weibull.par(q = q)
q <- stats::qweibull(p = c(0.025, 0.5, 0.975), shape = 0.01, scale = 1)
get.weibull.par(q = q)

p <- c(0.025, 0.50, 0.975)
q <- c(9.68, 29.2, 50.98)
fit.results <- rriskFitdist.perc(p, q, show.output = FALSE)
plotDiagnostics.perc(fit.results)

p <- c(0.25, 0.50, 0.75)
q <- c(9.68, 29.2, 50.98)
fit.results <- rriskFitdist.perc(p, q, show.output = FALSE)
plotDiagnostics.perc(fit.results)
plotDiagnostics.perc(fit.results, tolPlot = 2)

## Not run: 
##D   if( class(tcltk::tclRequire("Tktable")) == "tclObj" ) {
##D     res.fitcont <- fit.cont(data2fit = rnorm(100))
##D     res.fitcont
##D   }
##D   if( class(tcltk::tclRequire("Tktable")) == "tclObj" ) {
##D     res.fitperc <- fit.perc()
##D     res.fitperc
##D   }
## End(Not run)




