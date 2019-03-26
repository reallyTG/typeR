library(Bolstad2)


### Name: normGibbs
### Title: Draw a sample from a posterior distribution of data with an
###   unknown mean and variance using Gibbs sampling
### Aliases: normGibbs

### ** Examples

## firstly generate some random data
mu <- rnorm(1)
sigma <- rgamma(1,5,1)
y <- rnorm(100, mu, sigma)

## A \eqn{N(10,3^2)} prior for \eqn{\mu} and a 25 times inverse chi-squared
## with one degree of freedom prior for \eqn{\sigma^2}
MCMCSampleInd <- normGibbs(y, steps = 5000, priorMu = c(10,3),
                           priorVar = c(25,1))


## We can also use a joint conjugate prior for \eqn{\mu} and \eqn{\sigma^2}.
## This will be a \emph{normal}\eqn{(m,\sigma^2/n_0)} prior for \eqn{\mu} given
## the variance \eqn{\sigma^2}, and an \eqn{s0} times an \emph{inverse
## chi-squared} prior for \eqn{\sigma^2}.
MCMCSampleJoint <- normGibbs(y, steps = 5000, type = 'joint',
                             priorMu = c(10,3), priorVar = c(25,1))

## Now plot the results
oldPar <- par(mfrow=c(2,2))

plot(density(MCMCSampleInd$mu),xlab=expression(mu), main =
"Independent")
abline(v=mu)
plot(density(MCMCSampleInd$sig),xlab=expression(sig), main =
"Independent")
abline(v=sigma)

plot(density(MCMCSampleJoint$mu),xlab=expression(mu), main =
"Joint")
abline(v=mu)
plot(density(MCMCSampleJoint$sig),xlab=expression(sig), main =
"Joint")
abline(v=sigma)




