library(yuima)


### Name: spectralcov
### Title: Spectral Method for Cumulative Covariance Estimation
### Aliases: spectralcov lmm
### Keywords: ts

### ** Examples

# Example. One-dimensional and regular sampling case
# Here the simulated model is taken from Reiss (2011)

## Set a model
sigma <- function(t) sqrt(0.02 + 0.2 * (t - 0.5)^4)
modI <- setModel(drift = 0, diffusion = "sigma(t)")

## Generate a path of the process
set.seed(117)
n <- 12000
yuima.samp <- setSampling(Terminal = 1, n = n) 
yuima <- setYuima(model = modI, sampling = yuima.samp) 
yuima <- simulate(yuima, xinit = 0)

delta <- 0.01 # standard deviation of microstructure noise
yuima <- noisy.sampling(yuima, var.adj = delta^2) # generate noisy observations
plot(yuima)

## Estimation of the integrated volatility
est <- lmm(yuima)
est

## True integrated volatility and theoretical standard error
disc <- seq(0, 1, by = 1/n)
cat("true integrated volatility\n")
print(mean(sigma(disc[-1])^2))
cat("theoretical standard error\n")
print(sqrt(8*delta*mean(sigma(disc[-1])^3))/n^(1/4))

# Plotting the pilot estimate of the spot variance path
block <- 20
G <- seq(0,1,by=1/block)[1:block]
Sigma.p <- sigma(G)^2 # true spot variance
plot(zoo(Sigma.p, G), col = "blue",, xlab = "time", 
     ylab = expression(sigma(t)^2))
lines(zoo(est$Sigma.p, G))

## "Oracle" implementation
lmm(yuima, block = block, Sigma.p = Sigma.p, noise.var = delta^2)

# Example. Multi-dimensional case
# We simulate noisy observations of a correlated bivariate Brownian motion
# First we examine the regular sampling case since in this situsation the theoretical standard 
# error can easily be computed via the formulae given in p.88 of Bibinger et al. (2014)

## Set a model
drift <- c(0,0)

rho <- 0.5 # correlation

diffusion <- matrix(c(1,rho,0,sqrt(1-rho^2)),2,2)

modII <- setModel(drift=drift,diffusion=diffusion,
                  state.variable=c("x1","x2"),solve.variable=c("x1","x2"))
                  
## Generate a path of the latent process
set.seed(123)

## We regard the unit interval as 6.5 hours and generate the path on it 
## with the step size equal to 1 seconds

n <- 8000
yuima.samp <- setSampling(Terminal = 1, n = n) 
yuima <- setYuima(model = modII, sampling = yuima.samp) 
yuima <- simulate(yuima)

## Generate noisy observations
eta <- 0.05
yuima <- noisy.sampling(yuima, var.adj = diag(eta^2, 2))
plot(yuima)

## Estimation of the integrated covariance matrix
est <- lmm(yuima)
est

## Theoretical standard error
a <- sqrt(4 * eta * (sqrt(1 + rho) + sqrt(1 - rho)))
b <- sqrt(2 * eta * ((1 + rho)^(3/2) + (1 - rho)^(3/2)))
cat("theoretical standard error\n")
print(matrix(c(a,b,b,a),2,2)/n^(1/4))

## "Oracle" implementation
block <- 20
Sigma.p <- matrix(c(1,rho,rho,1),block,4,byrow=TRUE) # true spot covariance matrix
lmm(yuima, block = block, Sigma.p = Sigma.p, noise.var = rep(eta^2,2))

# Next we extract nonsynchronous observations from 
# the path generated above by Poisson random sampling
psample <- poisson.random.sampling(yuima, rate = c(1/2,1/2), n = n)

## Estimation of the integrated covariance matrix
lmm(psample)

## "Oracle" implementation
lmm(psample, block = block, Sigma.p = Sigma.p, noise.var = rep(eta^2,2))

## Other choices of tuning parameters (estimated values are not varied so much)
lmm(psample, block = 25)
lmm(psample, freq = 100)
lmm(psample, freq.p = 15)
lmm(psample, K = 8)




