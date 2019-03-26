library(lmomco)


### Name: cdfemu
### Title: Cumulative Distribution Function of the Eta-Mu Distribution
### Aliases: cdfemu
### Keywords: distribution cumulative distribution function Distribution:
###   Eta-Mu

### ** Examples

para <- vec2par(c(0.5, 1.4), type="emu")
cdfemu(1.2, para, yacoubsintegral=TRUE)
cdfemu(1.2, para, yacoubsintegral=FALSE)
## Not run: 
##D delx <- 0.01; x <- seq(0,3, by=delx)
##D nx <- 20*log10(x)
##D plot(c(-30,10), 10^c(-3,0), log="y", xaxs="i", yaxs="i",
##D      xlab="RHO", ylab="cdfemu(RHO)", type="n")
##D m <- 0.75
##D mus <- c(0.7425, 0.7125, 0.675, 0.6, 0.5, 0.45)
##D for(mu in mus) {
##D    eta <- sqrt((m / (2*mu))^-1 - 1)
##D    lines(nx, cdfemu(x, vec2par(c(eta, mu), type="emu")))
##D }
##D mtext("Yacoub (2007, figure 8)")
##D 
##D # Now add some last boundary lines
##D mu <- m; eta <- sqrt((m / (2*mu))^-1 - 1)
##D lines(nx, cdfemu(x, vec2par(c(eta, mu), type="emu")),  col=8, lwd=4)
##D mu <- m/2; eta <- sqrt((m / (2*mu))^-1 - 1)
##D lines(nx, cdfemu(x, vec2par(c(eta, mu), type="emu")), col=4, lwd=2, lty=2)
##D 
##D 
##D delx <- 0.01; x <- seq(0,3, by=delx)
##D nx <- 20*log10(x)
##D m <- 0.75; col <- 4; lty <- 2
##D plot(c(-30,10), 10^c(-3,0), log="y", xaxs="i", yaxs="i",
##D      xlab="RHO", ylab="cdfemu(RHO)", type="n")
##D for(mu in c(m/2,seq(m/2+0.01,m,by=0.01), m-0.001, m)) {
##D    if(mu > 0.67) { col <- 2; lty <- 1 }
##D    eta <- sqrt((m / (2*mu))^-1 - 1)
##D    lines(nx, cdfemu(x, vec2par(c(eta, mu), type="emu")),
##D          col=col, lwd=.75, lty=lty)
##D }
## End(Not run)



