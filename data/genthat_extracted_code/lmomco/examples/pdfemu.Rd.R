library(lmomco)


### Name: pdfemu
### Title: Probability Density Function of the Eta-Mu Distribution
### Aliases: pdfemu
### Keywords: distribution probability density function Distribution:
###   Eta-Mu

### ** Examples

## Not run: 
##D x <- seq(0,4, by=.1)
##D para <- vec2par(c(.5, 1.4), type="emu")
##D F <- cdfemu(x, para);         X <- quaemu(F, para)
##D plot(F, X, type="l", lwd=8);  lines(F, x, col=2)
##D 
##D delx <- 0.005
##D x <- seq(0,3, by=delx)
##D plot(c(0,3), c(0,1), xaxs="i", yaxs="i",
##D      xlab="RHO", ylab="pdfemu(RHO)", type="n")
##D mu <- 0.6
##D # Note that in order to produce the figure correctly using the etas
##D # shown in the figure that it must be recognized that these are the etas
##D # for format1, but all of the algorithms in lmomco are built around
##D # format2
##D etas.format1 <- c(0, 0.02, 0.05, 0.1, 0.2, 0.3, 0.5, 1)
##D etas.format2 <- (1 - etas.format1)/(1+etas.format1)
##D H <- etas.format2 / (1 - etas.format2^2)
##D h <-            1 / (1 - etas.format2^2)
##D for(eta in etas.format2) {
##D    lines(x, pdfemu(x, vec2par(c(eta, mu), type="emu")),
##D          col=rgb(eta^2,0,0))
##D }
##D mtext("Yacoub (2007, figure 5)")
##D 
##D plot(c(0,3), c(0,2), xaxs="i", yaxs="i",
##D      xlab="RHO", ylab="pdfemu(RHO)", type="n")
##D eta.format1 <- 0.5
##D eta.format2 <- (1 - eta.format1)/(1 + eta.format1)
##D mus <- c(0.25, 0.3, 0.5, 0.75, 1, 1.5, 2, 3)
##D for(mu in mus) {
##D    lines(x, pdfemu(x, vec2par(c(eta, mu), type="emu")))
##D }
##D mtext("Yacoub (2007, figure 6)")
##D 
##D plot(c(0,3), c(0,1), xaxs="i", yaxs="i",
##D      xlab="RHO", ylab="pdfemu(RHO)", type="n")
##D m <- 0.75
##D mus <- c(0.7425, 0.75, 0.7125, 0.675, 0.45, 0.5, 0.6)
##D for(mu in mus) {
##D    eta <- sqrt((m / (2*mu))^-1 - 1)
##D    print(eta)
##D    lines(x, pdfemu(x, vec2par(c(eta, mu), type="emu")))
##D }
##D mtext("Yacoub (2007, figure 7)") #
## End(Not run)



