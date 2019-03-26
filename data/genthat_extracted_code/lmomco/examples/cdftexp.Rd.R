library(lmomco)


### Name: cdftexp
### Title: Cumulative Distribution Function of the Truncated Exponential
###   Distribution
### Aliases: cdftexp
### Keywords: distribution cumulative distribution function Distribution:
###   Exponential (trimmed)

### ** Examples

cdftexp(50,partexp(vec2lmom(c(40,0.38), lscale=FALSE)))
## Not run: 
##D F <- seq(0,1,by=0.001)
##D A <- partexp(vec2lmom(c(100, 1/2), lscale=FALSE))
##D x <- quatexp(F, A)
##D plot(x, cdftexp(x, A), pch=16, type='l')
##D by <- 0.01; lcvs <- c(1/3, seq(1/3+by, 1/2-by, by=by), 1/2)
##D reds <- (lcvs - 1/3)/max(lcvs - 1/3)
##D for(lcv in lcvs) {
##D     A <- partexp(vec2lmom(c(100, lcv), lscale=FALSE))
##D     x <- quatexp(F, A)
##D     lines(x, cdftexp(x, A), pch=16, col=rgb(reds[lcvs == lcv],0,0))
##D }
##D 
##D   # Vogel and others (2008) example sighting times for the bird
##D   # Eskimo Curlew, inspection shows that these are fairly uniform.
##D   # There is a sighting about every year to two.
##D   T <- c(1946, 1947, 1948, 1950, 1955, 1956, 1959, 1960, 1961,
##D          1962, 1963, 1964, 1968, 1970, 1972, 1973, 1974, 1976,
##D          1977, 1980, 1981, 1982, 1982, 1983, 1985)
##D   R <- 1945 # beginning of record
##D   S <- T - R
##D   lmr <- lmoms(S)
##D   PARcurlew <- partexp(lmr)
##D   # read the warning message and then force the texp to the
##D   # stationary process model (min(tau_2) = 1/3).
##D   lmr$ratios[2] <- 1/3
##D   lmr$lambdas[2] <- lmr$lambdas[1]*lmr$ratios[2]
##D   PARcurlew <- partexp(lmr)
##D   Xmax <- quatexp(1, PARcurlew)
##D   X <- seq(0,Xmax, by=.1)
##D   plot(X, cdftexp(X,PARcurlew), type="l")
##D   # or use the MVUE estimator
##D   TE <- max(S)*((length(S)+1)/length(S)) # Time of Extinction
##D   lines(X, punif(X, min=0, max=TE), col=2)
## End(Not run)



