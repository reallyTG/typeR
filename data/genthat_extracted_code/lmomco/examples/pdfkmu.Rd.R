library(lmomco)


### Name: pdfkmu
### Title: Probability Density Function of the Kappa-Mu Distribution
### Aliases: pdfkmu
### Keywords: distribution probability density function Distribution:
###   Kappa-Mu

### ** Examples

## Not run: 
##D x <- seq(0,4, by=.1)
##D para <- vec2par(c(.5, 1.4), type="kmu")
##D F <- cdfkmu(x, para)
##D X <- quakmu(F, para, quahi=pi)
##D plot(F, X, type="l", lwd=8)
##D lines(F, x, col=2)
## End(Not run)
## Not run: 
##D # Note that in this example very delicate steps are taken to show
##D # how one interacts with the Dirac Delta function (x=0) when the m
##D # is known but mu == 0. For x=0, the fraction of total probability
##D # is recorded, but when one is doing numerical summation to evaluate
##D # whether the total probability under the PDF is unity some algebraic
##D # manipulations are needed as shown for the conditional when kappa
##D # is infinity.
##D 
##D delx <- 0.001
##D x <- seq(0,3, by=delx)
##D 
##D plot(c(0,3), c(0,1), xlab="RHO", ylab="pdfkmu(RHO)", type="n")
##D m <- 1.25
##D mus <- c(0.25, 0.50, 0.75, 1, 1.25, 0)
##D for(mu in mus) {
##D    kappa <- m/mu - 1 + sqrt((m/mu)*((m/mu)-1))
##D    para <- vec2par(c(kappa, mu), type="kmu")
##D    if(! is.finite(kappa)) {
##D       para <- vec2par(c(Inf,m), type="kmu")
##D       density <- pdfkmu(x, para)
##D       lines(x, density, col=2, lwd=3)
##D       dirac <- 1/delx - sum(density[x != 0])
##D       cumulant <- (sum(density) + density[1]*(1/delx - 1))*delx
##D       density[x == 0] <- rep(dirac, length(density[x == 0]))
##D       message("Total integrated probability is ", cumulant, "\n")
##D    }
##D    lines(x, pdfkmu(x, para))
##D }
##D mtext("Yacoub (2007, figure 3)")
## End(Not run)



