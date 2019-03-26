library(lmomco)


### Name: quatexp
### Title: Quantile Function of the Truncated Exponential Distribution
### Aliases: quatexp
### Keywords: distribution quantile function Distribution: Exponential
###   (trimmed)

### ** Examples

lmr <- vec2lmom(c(40,0.38), lscale=FALSE)
quatexp(0.5,partexp(lmr))
## Not run: 
##D F <- seq(0,1,by=0.001)
##D A <- partexp(vec2lmom(c(100, 1/2), lscale=FALSE))
##D plot(qnorm(F), quatexp(F, A), pch=16, type='l')
##D by <- 0.01; lcvs <- c(1/3, seq(1/3+by, 1/2-by, by=by), 1/2)
##D reds <- (lcvs - 1/3)/max(lcvs - 1/3)
##D for(lcv in lcvs) {
##D     A <- partexp(vec2lmom(c(100, lcv), lscale=FALSE))
##D     lines(qnorm(F), quatexp(F, A), col=rgb(reds[lcvs == lcv],0,0))
##D }
## End(Not run)



