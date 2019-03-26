library(lmomco)


### Name: pfactor.bernstein
### Title: Estimation of Optimal p-factor of Distributional Support
###   Estimation for Smoothed Quantiles from the Bernstein or Kantorovich
###   Polynomials
### Aliases: pfactor.bernstein
### Keywords: smoothing (Bernstein-Kantorovich)

### ** Examples

## Not run: 
##D pdf("pfactor_exampleB.pdf")
##D X <- exp(rnorm(200)); para <- parexp(lmoms(X))
##D # nsim is too small, but makes the following three not take too long
##D pfactor.bernstein(para, n=20, lmr.n="3", nsim=100, p.lo=.06, p.hi=.3)
##D pfactor.bernstein(para, n=20, lmr.n="4", nsim=100, p.lo=.06, p.hi=.3)
##D pfactor.bernstein(para, n=20, lmr.n="5", nsim=100, p.lo=.06, p.hi=.3)
##D dev.off()
## End(Not run)
## Not run: 
##D # Try intra-sample p-factor optimization from two perspectives. The 3-parameter
##D # GEV "over fits" the data and provides the parent.  Then use Tau3 of the fitted
##D # GEV for peakedness restraint and then use Tau3 of the data. Then repeat but use
##D # the apparent "exact" value of Tau3 for the true exponential parent.
##D pdf("pfactor_exampleB.pdf")
##D lmr <- vec2lmom(c(60,20)); paraA <- parexp(lmr); n <- 40
##D tr <- lmorph(par2lmom(paraA))$ratios[3]
##D X <- rlmomco(n, paraA); para <- pargev(lmoms(X))
##D F <- seq(0.001,0.999, by=0.001)
##D plot(qnorm(pp(X, a=0.40)), sort(X), type="n", log="y",
##D       xlab="Standard normal variate", ylab="Quantile",
##D       xlim=qnorm(range(F)), ylim=range(qlmomco(F,paraA)))
##D lines(qnorm(F), qlmomco(F, paraA), col=8, lwd=2)
##D lines(qnorm(F), qlmomco(F, para), lty=2)
##D points(qnorm(pp(X, a=0.40)), sort(X))
##D 
##D # Make sure to fill in the p-factor when needed!
##D bc <- list(poly.type = "Bernstein", bound.type="Carv",
##D            stat.type="Mean", fix.lower=0, fix.upper=NULL, p=NULL)
##D kc <- list(poly.type = "Kantorovich", bound.type="Carv",
##D            stat.type="Mean", fix.lower=0, fix.upper=NULL, p=NULL)
##D 
##D # Bernstein
##D A <- pfactor.bernstein(para,      n=n, nsim=100,              bern.control=bc)
##D B <- pfactor.bernstein(para, x=X, n=n, nsim=100,              bern.control=bc)
##D C <- pfactor.bernstein(para,      n=n, nsim=100, lmr.dist=tr, bern.control=bc)
##D D <- pfactor.bernstein(para, x=X, n=n, nsim=100, lmr.dist=tr, bern.control=bc)
##D plot(qnorm(pp(X, a=0.40)), sort(X), type="n", log="y",
##D       xlab="Standard normal variate", ylab="Quantile",
##D       xlim=qnorm(range(F)), ylim=range(qlmomco(F,paraA)))
##D lines(qnorm(F), qlmomco(F, paraA), col=8, lwd=2)
##D lines(qnorm(F), qlmomco(F, para), lty=2)
##D points(qnorm(pp(X, a=0.40)), sort(X))
##D       bc$p <- A$pfactor
##D lines(qnorm(F), dat2bernqua(F,X, bern.control=bc), col=2)
##D       bc$p <- B$pfactor
##D lines(qnorm(F), dat2bernqua(F,X, bern.control=bc), col=3)
##D       bc$p <- C$pfactor
##D lines(qnorm(F), dat2bernqua(F,X, bern.control=bc), col=2, lty=2)
##D       bc$p <- D$pfactor
##D lines(qnorm(F), dat2bernqua(F,X, bern.control=bc), col=3, lty=2)
##D # Kantorovich
##D A <- pfactor.bernstein(para,      n=n, nsim=100,              bern.control=kc)
##D B <- pfactor.bernstein(para, x=X, n=n, nsim=100,              bern.control=kc)
##D C <- pfactor.bernstein(para,      n=n, nsim=100, lmr.dist=tr, bern.control=kc)
##D D <- pfactor.bernstein(para, x=X, n=n, nsim=100, lmr.dist=tr, bern.control=kc)
##D plot(qnorm(pp(X, a=0.40)), sort(X), type="n", log="y",
##D       xlab="Standard normal variate", ylab="Quantile",
##D       xlim=qnorm(range(F)), ylim=range(qlmomco(F,paraA)))
##D lines(qnorm(F), qlmomco(F, paraA), col=8, lwd=2)
##D lines(qnorm(F), qlmomco(F, para), lty=2)
##D points(qnorm(pp(X, a=0.40)), sort(X))
##D       kc$p <- A$pfactor
##D lines(qnorm(F), dat2bernqua(F,X, bern.control=kc), col=2)
##D       kc$p <- B$pfactor
##D lines(qnorm(F), dat2bernqua(F,X, bern.control=kc), col=3)
##D       kc$p <- C$pfactor
##D lines(qnorm(F), dat2bernqua(F,X, bern.control=kc), col=2, lty=2)
##D       kc$p <- D$pfactor
##D lines(qnorm(F), dat2bernqua(F,X, bern.control=kc), col=3, lty=2)
##D dev.off()
## End(Not run)
## Not run: 
##D X <- exp(rnorm(200)); para <- parexp(lmoms(X))
##D "pfactor.root" <- function(para, p.lo, p.hi, ...) {
##D     afunc <- function(p, para=NULL, x=NULL, ...) {
##D       return(pfactor.bernstein(para=para, x=x, pfactors=p, ...)) }
##D     rt <- uniroot(afunc, c(p.lo, p.hi),
##D                   tol=0.001, maxiter=30, nsim=500, para=para, ...)
##D     return(rt)
##D }
##D pfactor.root(para, 0.05, 0.15, n=10, lmr.n="4")
##D pfactor.bernstein(para, n=10, lmr.n="4", nsim=200, p.lo=.05, p.hi=.15)
## End(Not run)



