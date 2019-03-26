library(lmomco)


### Name: stttlmomco
### Title: Scaled Total Time on Test Transform of Distributions
### Aliases: stttlmomco
### Keywords: quantile function scaled total time on test transform total
###   time on test transform lifetime/reliability analysis The lmomco
###   functions

### ** Examples

# It is easiest to think about residual life as starting at the origin,
# but for this example, let us set the lower limit at 100 days.
A <- vec2par(c(100, 2649, 2.11), type="gov")
f <- 0.47  # Both computations of Phi show 0.6455061
"afunc" <- function(p) { return(par2qua(p,A,paracheck=FALSE)) }
tmpa <- 1/cmlmomco(f=0, A); tmpb <- (1-f)*par2qua(f,A,paracheck=FALSE)
Phiu1 <- tmpa * ( tmpb + integrate(afunc,0,f)$value )
Phiu2 <- stttlmomco(f, A)
## Not run: 
##D # The TTT-plot (see Nair et al. (2013, p. 173))
##D n <- 30; X <- sort(rlmomco(n, A)); lmr <- lmoms(X)  # simulated lives and their L-moments
##D # recognize here that the "fit" is to the lifetime data themselves and not to special
##D # curves or projections of the data to other scales
##D "Phir" <- function(r, X, sort=TRUE) {
##D    n <- length(X); if(sort) X <- sort(X)
##D    if(r == 0) return(0) # can use 2:r as X_{0:n} is zero
##D    Tau.rOFn <- sapply(1:r, function(j) { Xlo <- ifelse((j-1) == 0, 0, X[(j-1)]);
##D                                          return((n-j+1)*(X[j] - Xlo)) })
##D    return(sum(Tau.rOFn))
##D }
##D Xbar <- mean(X); rOFn <- (1:n)/n # Nair et al. (2013) are clear r/n used in the Phi(u)
##D Phi <- sapply(1:n, function(r) { return(Phir(r,X, sort=FALSE)) }) / (n*Xbar)
##D layout(matrix(1:3, ncol=1))
##D plot(rOFn, Phi, type="b",
##D      xlab="NONEXCEEDANCE PROBABILITY", ylab="SCALED TOTAL TIME ON TEST")
##D lines(rOFn, stttlmomco(rOFn, A), lwd=2, col=8) # solid grey, the parent distribution
##D par1 <- pargov(lmr); par2 <- pargov(lmr, xi=min(X)) # notice attempt to "fit at minimum"
##D lines(pp(X), stttlmomco(rOFn, par1)) # now Weibull (i/(n+1)) being used for F via pp()
##D lines(pp(X), stttlmomco(rOFn, par2), lty=2) # perhaps better, but could miss short lives
##D F <- nonexceeds(f01=TRUE)
##D plot(pp(X), sort(X), xlab="NONEXCEEDANCE PROBABILITY", ylab="TOTAL TIME ON TEST (DAYS)")
##D lines(F, qlmomco(F, A), lwd=2, col=8) # the parent again
##D lines(F, qlmomco(F, par1), lty=1); lines(F, qlmomco(F, par2), lty=2) # two estimated fits
##D plot(F,  lrzlmomco(F, par2), col=2, type="l")  # Lorenz curve from L-moment fit (red)
##D lines(F, bfrlmomco(F, par2), col=3, lty=2) # Bonferroni curve from L-moment fit (green)
##D lines(F, lkhlmomco(F, par2), col=4, lty=4) # Leimkuhler curve from L-moment fit (blue)
##D lines(rOFn, Phi) # Scaled Total Time on Test
## End(Not run)



