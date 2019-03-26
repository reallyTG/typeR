library(lmomco)


### Name: cdfkmu
### Title: Cumulative Distribution Function of the Kappa-Mu Distribution
### Aliases: cdfkmu
### Keywords: distribution cumulative distribution function Distribution:
###   Kappa-Mu

### ** Examples

## Not run: 
##D x <- seq(0,3, by=0.5)
##D para <- vec2par(c(0.69, 0.625), type="kmu")
##D cdfkmu(x, para, marcumQ=TRUE, marcumQmethod="chisq")
##D cdfkmu(x, para, marcumQ=TRUE, marcumQmethod="delta")
##D cdfkmu(x, para, marcumQ=FALSE) # about 3 times slower
## End(Not run)
## Not run: 
##D para <- vec2par(c(0.69, 0.625), type="kmu")
##D quahi <- supdist(para, delexp=.1)$support[2]
##D cdfkmu(quahi, para, quahi=quahi)
## End(Not run)
## Not run: 
##D delx <- 0.01
##D x <- seq(0,3, by=delx)
##D 
##D plot(c(0,3), c(0,1), xlab="RHO", ylab="cdfkmu(RHO)", type="n")
##D para <- list(para=c(0, 0.75), type="kmu")
##D cdf <- cdfkmu(x, para)
##D lines(x, cdf, col=2, lwd=4)
##D para <- list(para=c(1, 0.5625), type="kmu")
##D cdf <- cdfkmu(x, para)
##D lines(x, cdf, col=3, lwd=4)
##D 
##D kappas <- c(0.00000001, 0.69, 1.37,  2.41, 4.45, 10.48, 28.49)
##D mus    <- c(0.75, 0.625,  0.5,  0.375, 0.25,  0.125, 0.05)
##D for(i in 1:length(kappas)) {
##D    kappa <- kappas[i]
##D    mu    <- mus[i]
##D    para <- list(para=c(kappa, mu), type="kmu")
##D    cdf <- cdfkmu(x, para)
##D    lines(x, cdf, col=i)
##D }
## End(Not run)
## Not run: 
##D delx <- 0.005
##D x <- seq(0,3, by=delx)
##D nx <- 20*log10(x)
##D plot(c(-30,10), 10^c(-4,0), log="y", xaxs="i", yaxs="i",
##D      xlab="RHO", ylab="cdfkmu(RHO)", type="n")
##D m <- 1.25
##D mus <- c(0.25, 0.50, 0.75, 1, 1.25, 0)
##D for(mu in mus) {
##D    col <- 1
##D    kappa <- m/mu - 1 + sqrt((m/mu)*((m/mu)-1))
##D    para <- vec2par(c(kappa, mu), type="kmu")
##D    if(! is.finite(kappa)) {
##D       para <- vec2par(c(Inf,m), type="kmu")
##D       col <- 2
##D    }
##D    lines(nx, cdfkmu(x, para), col=col)
##D }
##D mtext("Yacoub (2007, figure 4)")
## End(Not run)
## Not run: 
##D # The Marcum Q use for the CDF avoid numerical integration of pdfkmu(), but
##D # below is an example for which there is some failure that remains to be found.
##D para <- vec2par(c(10, 23), type="kmu")
##D # The following are reliable but slower as they avoid the Marcum Q function
##D # and use traditional numerical integration of the PDF function.
##D A <- cdfkmu(c(0.10, 0.35, 0.9, 1, 1.16), para, marcumQ=FALSE)
##D # Continuing, the first value in c() has an erroneous value for the next call.
##D B <- cdfkmu(c(0.10, 0.35, 0.9, 1, 1.16), para, marcumQ=TRUE)
##D # But this distribution is tightly peaks and well away from the origin, so in
##D # order to snap the erroneous value to zero, we need a successful median
##D # computation.  We can try again using the qualo argument to pass through to
##D # quakmu() like the following:
##D C <- cdfkmu(c(0.10, 0.35, 0.9, 1, 1.16), para, marcumQ=TRUE, qualo=0.4)
##D # The existance of the median for the last one also triggers a truncation of
##D # the CDF to 0 when negative solution results for the 0.35, although the
##D # negative is about -1E-14.
## End(Not run)
## Not run: 
##D # Does the discipline of the signal litature just "know" about the apparent
##D # upper support of the Kappa-Mu being quite near or even at pi?
##D "simKMU" <- function() {
##D    km <- 10^runif(2, min=-3, max=3)
##D    f <- cdfkmu(pi, vec2par(km, type="kmu"))
##D    return(c(km, f))
##D }
##D EndStudy <- sapply(1:1000, function(i) { simKMU() } )
##D boxplot(EndStudy[3,])
## End(Not run)



