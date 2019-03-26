library(lmomco)


### Name: parTLgld
### Title: Estimate the Parameters of the Generalized Lambda Distribution
###   using Trimmed L-moments (t=1)
### Aliases: parTLgld
### Keywords: distribution (parameters) Distribution: Generalized Lambda

### ** Examples

# As of version 1.6.2, it is felt that in spirit of CRAN CPU
# reduction that the intensive operations of parTLgld() should
# be kept a bay.

## Not run: 
##D X <- rgamma(202,2) # simulate a skewed distribution
##D lmr <- TLmoms(X, trim=1) # compute trimmed L-moments
##D PARgldTL <- parTLgld(lmr) # fit the GLD
##D 
##D F <- pp(X) # plotting positions for graphing
##D plot(F,sort(X), col=8, cex=0.25)
##D lines(F, qlmomco(F,PARgldTL)) # show the best estimate
##D if(! is.null(PARgldTL$rest)) { 
##D   n <- length(PARgldTL$rest$xi)
##D   other <- unlist(PARgldTL$rest[n,1:4]) # show alternative
##D   lines(F, qlmomco(F,vec2par(other, type="gld")), col=2)
##D }
##D # Note in the extraction of other solutions that no testing for whether
##D # additional solutions were found is made. Also, it is quite possible
##D # that the other solutions "[n,1:4]" is effectively another numerical
##D # convergence on the primary solution. Some users of this example thus
##D # might not see two separate lines. Users are encouraged to inspect the
##D # rest of the solutions: print(PARgld$rest)
##D 
##D # For one run of the above example, the GLD results follow
##D #print(PARgldTL)
##D #$type
##D #[1] "gld"
##D #$para
##D #         xi       alpha       kappa           h
##D # 1.02333964 -3.86037875 -0.06696388 -0.22100601
##D #$delTau5
##D #[1] -0.02299319
##D #$error
##D #[1] 7.048409e-08
##D #$source
##D #[1] "pargld"
##D #$rest
##D #         xi     alpha       kappa          h attempt     delTau5        error
##D #1  1.020725 -3.897500 -0.06606563 -0.2195527       6 -0.02302222 1.333402e-08
##D #2  1.021203 -3.895334 -0.06616654 -0.2196020       4 -0.02304333 8.663930e-11
##D #3  1.020684 -3.904782 -0.06596204 -0.2192197       5 -0.02306065 3.908918e-09
##D #4  1.019795 -3.917609 -0.06565792 -0.2187232       2 -0.02307092 2.968498e-08
##D #5  1.023654 -3.883944 -0.06668986 -0.2198679       7 -0.02315035 2.991811e-07
##D #6 -4.707935 -5.044057  5.89280906 -0.3261837      13  0.04168800 2.229672e-10
## End(Not run)

## Not run: 
##D F <- seq(.01,.99,.01)
##D plot(F,qlmomco(F, vec2par(c( 1.02333964, -3.86037875,
##D                             -0.06696388, -0.22100601), type="gld")),
##D      type="l")
##D lines(F,qlmomco(F, vec2par(c(-4.707935, -5.044057,
##D                               5.89280906, -0.3261837), type="gld")))
## End(Not run)



