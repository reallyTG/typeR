library(fitdistrplus)


### Name: mmedist
### Title: Matching moment fit of univariate distributions
### Aliases: mmedist mme
### Keywords: distribution

### ** Examples


# (1) basic fit of a normal distribution with moment matching estimation
#

set.seed(1234)
n <- 100
x1 <- rnorm(n=n)
mmedist(x1, "norm")

#weighted
w <- c(rep(1, n/2), rep(10, n/2))
mmedist(x1, "norm", weights=w)$estimate


# (2) fit a discrete distribution (Poisson)
#

set.seed(1234)
x2 <- rpois(n=30,lambda = 2)
mmedist(x2, "pois")

# (3) fit a finite-support distribution (beta)
#

set.seed(1234)
x3 <- rbeta(n=100,shape1=5, shape2=10)
mmedist(x3, "beta")


# (4) fit a Pareto distribution
#

## Not run: 
##D   require(actuar)
##D   #simulate a sample
##D   x4  <-  rpareto(1000, 6, 2)
##D 
##D   #empirical raw moment
##D   memp  <-  function(x, order) mean(x^order)
##D   memp2 <- function(x, order, weights) sum(x^order * weights)/sum(weights)
##D 
##D   #fit by MME
##D   mmedist(x4, "pareto", order=c(1, 2), memp=memp, 
##D     start=list(shape=10, scale=10), lower=1, upper=Inf)
##D   #fit by weighted MME
##D   w <- rep(1, length(x4))
##D   w[x4 < 1] <- 2
##D   mmedist(x4, "pareto", order=c(1, 2), memp=memp2, weights=w,
##D     start=list(shape=10, scale=10), lower=1, upper=Inf)
## End(Not run)




