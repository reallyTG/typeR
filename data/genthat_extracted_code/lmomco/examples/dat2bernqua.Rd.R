library(lmomco)


### Name: dat2bernqua
### Title: Observed Data to Empirical Quantiles through Bernstein or
###   Kantorovich Polynomials
### Aliases: dat2bernqua
### Keywords: smoothing (Bernstein-Kantorovich) smoothing (Bernstein
###   polynomial) smoothing (Kantorovich polynomial) smoothing (Parzen
###   weighting) quantile function

### ** Examples

# Compute smoothed extremes, quartiles, and median
# The smoothing seems to extend to F=0 and F=1.
set.seed(1); X <- exp(rnorm(20)); F <- c(0,.25,.50,.75,1)
dat2bernqua(F, X, bound.type="none", listem=TRUE)$x
dat2bernqua(F, X, bound.type="Carv", listem=TRUE)$x
dat2bernqua(F, X, bound.type="sd", listem=TRUE)$x
dat2bernqua(F, X, bound.type="either", listem=TRUE)$x
dat2bernqua(F, X, bound.type="sd", fix.lower=0, listem=TRUE)$x
# Notice that the lower extreme between the last two calls
# changes from a negative to a positive number when the lower
# bounds is "known" to be zero.
## Not run: 
##D X <- sort(10^rnorm(20)); F <- nonexceeds(f01=TRUE)
##D plot(qnorm(pp(X)), X, xaxt="n", xlab="", ylab="QUANTILE", log="y")
##D add.lmomco.axis(las=2, tcl=0.5, side.type="NPP", twoside=TRUE)
##D lines(qnorm(F),     dat2bernqua(F,    X, bound.type="sd"), col=2, lwd=2)
##D lines(qnorm(F), exp(dat2bernqua(F,log(X), bound.type="sd")))
## End(Not run)
## Not run: 
##D X <- exp(rnorm(20)); F <- seq(0.001, 0.999, by=.001)
##D dat2bernqua(0.9, X, poly.type="Bernstein",   listem=TRUE)$x
##D dat2bernqua(0.9, X, poly.type="Kantorovich", listem=TRUE)$x
##D dat2bernqua(0.9, X, poly.type="Cheng",       listem=TRUE)$x
##D plot(pp(X), sort(X), log="y", xlim=range(F))
##D lines(F, dat2bernqua(F, X, poly.type="Bernstein"), col=2)   # red
##D lines(F, dat2bernqua(F, X, poly.type="Kantorovich"), col=3) # green
##D lines(F, dat2bernqua(F, X, poly.type="Cheng"), col=4)       # blue
## End(Not run)
## Not run: 
##D X <- exp(rnorm(20)); F <- nonexceeds()
##D plot(pp(X), sort(X))
##D lines(F, dat2bernqua(F,X, bound.type="sd", poly.type="Bernstein"))
##D lines(F, dat2bernqua(F,X, bound.type="sd", poly.type="Kantorovich"), col=2)
## End(Not run)
## Not run: 
##D X <- rnorm(25); F <- nonexceeds()
##D Q <- dat2bernqua(F, X) # the Bernstein estimates
##D plot(F,  dat2bernqua(F, X, bound.type="Carv"), type="l")
##D lines(F, dat2bernqua(F, X, bound.type="sd"), col=2)
##D lines(F, dat2bernqua(F, X, bound.type="none"), col=3)
##D points(pp(X), sort(X), pch=16, cex=.75, col=4)
## End(Not run)
## Not run: 
##D set.seed(13)
##D par <- parkap(vec2lmom(c(1,.5,.4,.2)))
##D F <- seq(0.001,0.999,by=.001)
##D X <- sort(rlmomco(100, par))
##D pp <- pp(X)
##D pdf("lmomco_example_dat2bernqua.pdf")
##D plot(qnorm(pp(X)), dat2bernqua(pp, X), col=4, pch=1,
##D      ylim=c(0,qlmomco(0.9999, par)))
##D lines(qnorm(F), dat2bernqua(F, sort(X)), col=4)
##D lines(qnorm(F), qlmomco(F, par), col=2)
##D sampar <- parkap(lmoms(X))
##D sampar2 <- parkap(lmoms(dat2bernqua(pp, X)))
##D lines(qnorm(pp(F)), qlmomco(F, sampar), col=1)
##D lines(qnorm(pp(F)), qlmomco(F, sampar2), col=4, lty=2)
##D points(qnorm(pp(X)), X, col=1, pch=16)
##D 
##D plot(qnorm(pp(X)), dat2bernqua(pp, X, altsupport=TRUE), col=4, pch=1,
##D      ylim=c(0,qlmomco(0.9999, par)))
##D lines(qnorm(F), dat2bernqua(F, sort(X), altsupport=TRUE), col=4)
##D lines(qnorm(F), qlmomco(F, par), col=2)
##D sampar <- parkap(lmoms(X))
##D sampar2 <- parkap(lmoms(dat2bernqua(pp, X, altsupport=TRUE)))
##D lines(qnorm(pp(F)), qlmomco(F, sampar), col=1)
##D lines(qnorm(pp(F)), qlmomco(F, sampar2), col=4, lty=2)
##D points(qnorm(pp(X)), X, col=1, pch=16)
##D dev.off()
## End(Not run)



