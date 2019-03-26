library(lmomco)


### Name: pargld
### Title: Estimate the Parameters of the Generalized Lambda Distribution
### Aliases: pargld
### Keywords: distribution (parameters) Distribution: Generalized Lambda

### ** Examples

## Not run: 
##D X <- rgamma(202,2) # simulate a skewed distribution
##D lmr <- lmoms(X) # compute trimmed L-moments
##D PARgld <- pargld(lmr) # fit the GLD
##D F <- pp(X)
##D plot(F,sort(X), col=8, cex=0.25)
##D lines(F, qlmomco(F,PARgld)) # show the best estimate
##D if(! is.null(PARgld$rest)) { #$
##D   n <- length(PARgld$rest$xi)
##D   other <- unlist(PARgld$rest[n,1:4]) #$ # show alternative
##D   lines(F, qlmomco(F,vec2par(other, type="gld")), col=2)
##D }
##D # Note in the extraction of other solutions that no testing for whether
##D # additional solutions were found is made. Also, it is quite possible
##D # that the other solutions "[n,1:4]" is effectively another numerical
##D # convergence on the primary solution. Some users of this example thus
##D # might not see two separate lines. Users are encouraged to inspect the
##D # rest of the solutions: print(PARgld$rest); #$
##D 
##D # For one run of the above example, the GLD results follow
##D #print(PARgld)
##D #$type
##D #[1] "gld"
##D #$para
##D #      xi    alpha    kappa        h
##D #3.144379 2.943327 7.420334 1.050792
##D #$delTau5
##D #[1] -0.0367435
##D #$error
##D #[1] 5.448016e-10
##D #$source
##D #[1] "pargld"
##D #$rest
##D #         xi    alpha       kappa         h attempt     delTau5        error
##D #1 3.1446434 2.943469 7.421131671 1.0505370      14 -0.03675376 6.394270e-10
##D #2 0.4962471 8.794038 0.008295796 0.2283519       4 -0.04602541 8.921139e-10
## End(Not run)
## Not run: 
##D F <- seq(.01,.99,.01)
##D plot(F, qlmomco(F, vec2par(c(3.1446434, 2.943469, 7.4211316, 1.050537), type="gld")),
##D      type="l")
##D lines(F,qlmomco(F, vec2par(c(0.4962471, 8.794038, 0.0082958, 0.228352), type="gld")))
## End(Not run)



