library(copBasic)


### Name: EMPIRcopdf
### Title: Dataframe of the Bivariate Empirical Copula
### Aliases: EMPIRcopdf
### Keywords: empirical copula empirical copula (utility)

### ** Examples

## Not run: 
##D psp <- simCOP(n=39, cop=PSP, ploton=FALSE, points=FALSE) * 150
##D # Pretend psp is real data, the * 150 is to clearly get into an arbitrary unit system.
##D 
##D # The sort=FALSE is critical in the following two calls to pp() from lmomco.
##D fakeU <- lmomco::pp(psp[,1], sort=FALSE) # Weibull plotting position i/(n+1)
##D fakeV <- lmomco::pp(psp[,2], sort=FALSE) # Weibull plotting position i/(n+1)
##D uv <- data.frame(U=fakeU, V=fakeV) # our U-statistics
##D 
##D empcop <- EMPIRcopdf(para=uv)
##D plot(empcop$u, empcop$v, cex=1.75*empcop$empcop, pch=16,
##D      xlab="U NONEXCEEDANCE PROBABILITY", ylab="V NONEXCEEDANCE PROBABILITY")
##D # Dot size increases with joint probability (height of the copulatic surface).
##D points(empcop$u, empcop$v, col=2) # red circles
## End(Not run)



