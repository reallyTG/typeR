library(diversitree)


### Name: mcmc
### Title: Simple Markov Chain Monte Carlo with Slice Sampling
### Aliases: mcmc mcmc.default sampler.slice sampler.norm
### Keywords: models

### ** Examples

## To demonstrate, start with a simple bivariate normal.  The function
## 'make.mvn' creates likelihood function for the multivariate normal
## distribution given 'mean' (a vector) and 'vcv' (the variance
## covariance matrix).  This is based on mvnorm in the package
## mvtnorm, but will be faster where the vcv does not change between
## calls.
make.mvn <- function(mean, vcv) {
  logdet <- as.numeric(determinant(vcv, TRUE)$modulus)
  tmp <- length(mean) * log(2 * pi) + logdet
  vcv.i <- solve(vcv)

  function(x) {
    dx <- x - mean
    -(tmp + rowSums((dx %*% vcv.i) * dx))/2
  }
}

## Our target distribution has mean 0, and a VCV with positive
## covariance between the two parameters.
vcv <- matrix(c(1, .25, .25, .75), 2, 2)
lik <- make.mvn(c(0, 0), vcv)

## Sample 500 points from the distribution, starting at c(0, 0).
set.seed(1)
samples <- mcmc(lik, c(0, 0), 500, 1, print.every=100)

## The marginal distribution of V1 (the first axis of the
## distribution) should be a normal distribution with mean 0 and
## variance 1:
curve(dnorm, xlim=range(samples$X1), ylim=c(0, .5), col="red")
hist(samples$X1, 30, add=TRUE, freq=FALSE)

plot(X2 ~ X1, samples, pch=19, cex=.2, col="#00000055", asp=1)

## The estimated variance here matches nicely with the true VCV: (These
## all look much better if you increase the number of sampled points,
## say to 10,000)
var(samples[2:3])

## The above uses slice sampling.  We can use simple Gaussian updates
## instead.  This performs updates with standard deviation '1' in each
## direction.  Unlike slice sampling, the 'w' parameter here will
## matter a great deal in determining how fast the chain will mix.
samples.norm <- mcmc(lik, c(0, 0), 500, 1, print.every=100,
                     sampler=sampler.norm)

## This *appears* to run much faster than the slice sampling based
## approach above, but the effective sample size of the second
## approach is much lower.  The 'effectiveSize' function in coda says
## that for 10,000 samples using slice sampling, the effective sample
## size (equivalent number of independent samples) is about 8,500, but
## for the Gaussian updates is only 1,200.  This can be seen by
## comparing the autocorrelation between samples from the two
## different runs.  
op <- par(oma=c(0, 0, 2, 0))
acf(samples[2:3])
title(main="Slice sampling", outer=TRUE)

acf(samples.norm[2:3])
title(main="Gaussian updates", outer=TRUE)

## The autocorrelation is negligable after just 2 samples under slice
## sampling, but remains significant for about 15 with Gaussian
## updates.

## Not run: 
##D ## Next, a diversitree likelihood example.  This example uses a 203
##D ## species phylogeny evolved under the BiSSE model.  This takes a
##D ## more substantial amount of time, so is not evaluated by default.
##D pars <- c(0.1, 0.2, 0.03, 0.03, 0.01, 0.01)
##D set.seed(2)
##D phy <- tree.bisse(pars, max.t=60, x0=0)
##D 
##D ## First, create a likelihood function:
##D lik <- make.bisse(phy, phy$tip.state)
##D lik(pars)
##D 
##D ## This produces about a sample a second, so takes a while.  The "upper"
##D ## limit is a hard upper limit, above which the sampler will never let
##D ## the parameter go (in effect, putting a uniform prior on the range
##D ## lower..upper, and returning the joint distribution conditional on the
##D ## parameters being in this range).
##D tmp <- mcmc(lik, pars, nsteps=100, w=.1)
##D 
##D ## The argument 'w' works best when it is about the width of the "high
##D ## probability" region for that parameter.  This takes the with of the
##D ## 90% quantile range.  The resulting widths are only slightly faster
##D ## than the first guess.  Samples are generated about 1/s; allow 15
##D ## minutes to generate 1000 samples.
##D w <- diff(sapply(tmp[2:7], quantile, c(.05, .95)))
##D out <- mcmc(lik, pars, nsteps=1000, w=w)
##D 
##D ## You can do several things with this.  Look for candidate ML points:
##D out[which.max(out$p),]
##D 
##D ## Or look at the marginal distribution of parameters
##D profiles.plot(out["lambda0"], col.line="red")
##D 
##D ## Or look at the joint marginal distribution of pairs of parameters
##D plot(lambda0 ~ mu0, out)
## End(Not run)




