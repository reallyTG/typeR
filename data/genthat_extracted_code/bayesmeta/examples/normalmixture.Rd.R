library(bayesmeta)


### Name: normalmixture
### Title: Compute normal mixtures
### Aliases: normalmixture
### Keywords: distribution

### ** Examples

##################################################################
# compare half-normal mixing distributions with different scales:
nm05 <- normalmixture(cdf=function(x){phalfnormal(x, scale=0.5)})
nm10 <- normalmixture(cdf=function(x){phalfnormal(x, scale=1.0)})
# (this corresponds to the case of assuming a half-normal prior
# for the heterogeneity tau)

# check the structure of the returned object:
str(nm05)

# show density functions:
# (these would be the marginal (prior predictive) distributions
# of study-specific effects theta[i])
x <- seq(-1, 3, by=0.01)
plot(x, nm05$density(x), type="l", col="blue", ylab="density")
lines(x, nm10$density(x), col="red")
abline(h=0, v=0, col="grey")

# show cumulative distributions:
plot(x, nm05$cdf(x), type="l", col="blue", ylab="CDF")
lines(x, nm10$cdf(x), col="red")
abline(h=0:1, v=0, col="grey")

# determine 5 percent and 95 percent quantiles:
rbind("HN(0.5)"=nm05$quantile(c(0.05,0.95)),
      "HN(1.0)"=nm10$quantile(c(0.05,0.95)))


##################################################################
# compare different mixing distributions
# (half-normal, half-Cauchy, exponential and Lomax):
nmHN <- normalmixture(cdf=function(x){phalfnormal(x, scale=0.5)})
nmHC <- normalmixture(cdf=function(x){phalfcauchy(x, scale=0.5)})
nmE  <- normalmixture(cdf=function(x){pexp(x, rate=2)})
nmL  <- normalmixture(cdf=function(x){plomax(x, shape=4, scale=2)})

# show densities (logarithmic y-axis):
x <- seq(-1, 3, by=0.01)
plot(x,  nmHN$density(x), col="green",  type="l", ylab="density", ylim=c(0.005, 6.5), log="y")
lines(x, nmHC$density(x), col="red")
lines(x, nmE$density(x),  col="blue")
lines(x, nmL$density(x),  col="cyan")
abline(v=0, col="grey")

# show CDFs:
plot(x,  nmHN$cdf(x), col="green",  type="l", ylab="CDF", ylim=c(0,1))
lines(x, nmHC$cdf(x), col="red")
lines(x, nmE$cdf(x),  col="blue")
lines(x, nmL$cdf(x),  col="cyan")
abline(h=0:1, v=0, col="grey")
# add "exponential" x-axis at top:
axis(3, at=log(c(0.5,1,2,5,10,20)), lab=c(0.5,1,2,5,10,20))
# show 95 percent quantiles:
abline(h=0.95, col="grey", lty="dashed")
abline(v=nmHN$quantile(0.95), col="green", lty="dashed")
abline(v=nmHC$quantile(0.95), col="red", lty="dashed")
abline(v=nmE$quantile(0.95),  col="blue", lty="dashed")
abline(v=nmL$quantile(0.95),  col="cyan", lty="dashed")
rbind("half-normal(0.5)"=nmHN$quantile(0.95),
      "half-Cauchy(0.5)"=nmHC$quantile(0.95),
      "exponential(2.0)"=nmE$quantile(0.95),
      "Lomax(4,2)"      =nmL$quantile(0.95))


#####################################################################
# a normal mixture distribution example where the solution
# is actually known analytically: the Student-t distribution.
# If  Y|sigma ~ N(0,sigma^2),  where  sigma = sqrt(k/X)
# and  X|k ~ Chi^2(df=k),
# then the marginal  Y|k  is Student-t with k degrees of freedom.

# define CDF of sigma:
CDF <- function(sigma, df){pchisq(df/sigma^2, df=df, lower.tail=FALSE)}

# numerically approximate normal mixture (with k=5 d.f.):
k <- 5
nmT1 <- normalmixture(cdf=function(x){CDF(x, df=k)})
# in addition also try a more accurate approximation:
nmT2 <- normalmixture(cdf=function(x){CDF(x, df=k)}, delta=0.001, epsilon=0.00001)
# check: how many grid points were required?
nmT1$bins
nmT2$bins

# show true and approximate densities:
x <- seq(-2,10,le=400)
plot(x, dt(x, df=k), type="l")
abline(h=0, v=0, col="grey")
lines(x, nmT1$density(x), col="red", lty="dashed")
lines(x, nmT2$density(x), col="blue", lty="dotted")

# show ratios of true and approximate densities:
plot(x, nmT1$density(x)/dt(x, df=k), col="red",
     type="l", log="y", ylab="density ratio")
abline(h=1, v=0, col="grey")
lines(x, nmT2$density(x)/dt(x, df=k), col="blue")



