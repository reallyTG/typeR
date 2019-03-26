library(lmomco)


### Name: dat2bernquaf
### Title: Equivalent Nonexceedance Probability for a Given Value through
###   Observed Data to Empirical Quantiles through Bernstein or Kantorovich
###   Polynomials
### Aliases: dat2bernquaf
### Keywords: smoothing (Bernstein-Kantorovich) smoothing (Bernstein
###   polynomial) smoothing (Kantorovich polynomial) smoothing (Parzen
###   weighting) quantile function

### ** Examples

dat2bernquaf(6, c(2,10)) # median 1/2 of 2 and 10 is 6 (trivial and fast)
## Not run: 
##D set.seed(5135)
##D lmr <- vec2lmom(c(1000, 400, 0.2, 0.3, 0.045))
##D par <- lmom2par(lmr, type="wak")
##D Q <- rlmomco(83, par) # n = 83 and extremely non-Normal data
##D lgQ <- max(Q) # 5551.052 by theory
##D dat2bernquaf(median(Q), Q)$f  # returns 0.5100523 (nearly 1/2)
##D dat2bernquaf(lgQ, Q)$f                   # unable to root
##D dat2bernquaf(lgQ, Q, bound.type="sd")$f  # unable to root
##D itf <- c(0.5, 0.99999)
##D f <- dat2bernquaf(lgQ, Q, interval=itf, bound.type="sd")$f
##D print(f) # F=0.9961118
##D qlmomco(f, par) # 5045.784 for the estimate F=0.9961118
##D # If we were not using the maximum and something more near the center of the
##D # distribution then that estimate would be closer to qlmomco(f, par).
##D # You might consider lqQ <- qlmomco(0.99, Q) # theoretical 99th percentile and
##D # let the random seed wander and see the various results.
## End(Not run)



