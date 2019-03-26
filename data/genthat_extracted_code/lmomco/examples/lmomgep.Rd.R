library(lmomco)


### Name: lmomgep
### Title: L-moments of the Generalized Exponential Poisson Distribution
### Aliases: lmomgep
### Keywords: L-moment (distribution) Distribution: Generalized Exponential
###   Poisson

### ** Examples

## Not run: 
##D gep <- vec2par(c(2, 1.5, 3), type="gep")
##D lmrA <- lmomgep(gep, byqua=TRUE);   print(lmrA)
##D lmrB <- lmomgep(gep, byqua=FALSE);  print(lmrB)
##D 
##D # Because the L-moments of the Generalized Exponential Poisson are computed
##D # strictly from the expectations of the order statistic extrema, lets us evaluate
##D # by theoretical integration of the quantile function and simulation:
##D set.seed(10); gep <- vec2par(c(2, 1.5, 3), type="gep")
##D lmr  <- lmomgep(gep, byqua=FALSE)
##D E33a <- (lmr$lambdas[3] + 3*lmr$lambdas[2] + 2*lmr$lambdas[1])/2  # 2.130797
##D E33b <- expect.max.ostat(3, para=gep, qua=quagep)                 # 2.137250
##D E33c <- mean(replicate(20000, max(quagep(runif(3), gep))))        # 2.140226
##D # See how the E[X_{3:3}] by the formula shown in this documentation results in
##D # a value that is about 0.007 too small. Now this might now seem large but it
##D # is a difference.  Try gep <- list(para=c(2, 1.5, 13), type="gep") or
##D #  gep <- list(para=c(2, .08, 21), type="gep"), which fails on byqua=TRUE
## End(Not run)



