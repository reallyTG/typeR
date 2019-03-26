library(lmomco)


### Name: quagpa
### Title: Quantile Function of the Generalized Pareto Distribution
### Aliases: quagpa
### Keywords: distribution quantile function Distribution: Generalized
###   Pareto

### ** Examples

  lmr <- lmoms(c(123,34,4,654,37,78))
  quagpa(0.5,pargpa(lmr))
## Not run: 
##D # Let us compare L-moments, parameters, and 90th percentile for a simulated
##D # GPA distibution of sample size 100 having the following parameters between
##D # lmomco and lmom packages in R. The answers are the same.
##D gpa.par <- lmomco::vec2par(c(1.02787, 4.54603, 0.07234), type="gpa")
##D X <- lmomco::rlmomco(100, gpa.par)
##D lmom::samlmu(X)
##D lmomco::lmoms(X)
##D lmom::pelgpa(lmom::samlmu(X))
##D lmomco::pargpa(lmomco::lmoms(X))
##D lmom::quagpa(0.90, lmom::pelgpa(lmom::samlmu(X)))
##D lmomco::quagpa(0.90, lmomco::pargpa(lmomco::lmoms(X)))
## End(Not run)



