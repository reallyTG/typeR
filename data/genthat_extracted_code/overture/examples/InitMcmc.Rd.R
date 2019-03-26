library(overture)


### Name: InitMcmc
### Title: Initialize a Markov chain Monte Carlo run
### Aliases: InitMcmc

### ** Examples

# Beta-binomial -----------------------------------------------------------
## Likelihood:
## x|theta ~ Binomial(n, theta)
## Prior:
## theta ~ Unif(0, 1)

theta.truth <- 0.75
n.obs <- 100
x <- rbinom(1, n.obs, prob=theta.truth)

# Sampling function
SampleTheta <- function() {
    rbeta(1, 1 + x, 1 + n.obs - x)
}

# MCMC
Mcmc <- InitMcmc(1000)
samples <- Mcmc({
    theta <- SampleTheta()
})

# Plot posterior distribution
hist(samples$theta, freq=FALSE, main="Posterior", xlab=expression(theta))
theta.grid <- seq(min(samples$theta), max(samples$theta), length.out=500)
lines(theta.grid, dbeta(theta.grid, 1 + x, 1 + n.obs - x), col="blue")
abline(v=theta.truth, col="red")
legend("topleft", legend=c("Analytic posterior", "Simulation truth"),
       lty=1, col=c("blue", "red"), cex=0.75)

# Estimating mean with unknown variance -----------------------------------
## Likelihood:
## x|mu, sigma^2 ~ N(mu, sigma^2)
## Prior:
## p(mu) \propto 1
## p(sigma^2) \propto 1/sigma^2

# Simulated data
mu.truth <- 10
sigma.2.truth <- 2
n.obs <- 100
x <- rnorm(n.obs, mu.truth, sqrt(sigma.2.truth))
x.bar <- mean(x)

# Sampling functions
SampleMu <- function(sigma.2) {
    rnorm(1, x.bar, sqrt(sigma.2/n.obs))
}

SampleSigma2 <- function(mu) {
    1/rgamma(1, n.obs/2, (1/2)*sum((x-mu)^2))
}

# MCMC
Mcmc <- InitMcmc(1000, thin=10, exclude="sigma.2")
sigma.2 <- 1 # Initialize parameter
samples <- Mcmc({
    mu <- SampleMu(sigma.2)
    sigma.2 <- SampleSigma2(mu)
})

# Plot posterior distribution
hist(samples$mu, xlab=expression(mu), main="Posterior")
abline(v=mu.truth, col="red")
legend("topleft", legend="Simulation truth", lty=1, col="red", cex=0.75)

# sigma.2 is excluded from saved samples
is.null(samples$sigma.2)

# Linear regression -------------------------------------------------------
## Likelihood:
## y|beta, sigma^2, x ~ N(x %*% beta, sigma^2 * I)
## Prior:
## p(beta, sigma^2|x) \propto 1/sigma^2

# Simulated data
n.obs <- 100
x <- matrix(NA, nrow=n.obs, ncol=3)
x[,1] <- 1
x[,2] <- rnorm(n.obs)
x[,3] <- x[,2] + rnorm(n.obs)
beta.truth <- c(1, 2, 3)
sigma.2.truth <- 5
y <- rnorm(n.obs, x %*% beta.truth, sqrt(sigma.2.truth))

# Calculations for drawing beta
l.mod <- lm(y ~ x - 1)
beta.hat <- l.mod$coefficients
xtx.inv <- summary(l.mod)$cov.unscaled
xtx.inv.chol <- chol(xtx.inv)

# Calculations for drawing sigma.2
a.sigma.2 <- (n.obs - length(beta.hat))/2
b.sigma.2 <- (1/2) * t(y - x %*% beta.hat) %*% (y - x %*% beta.hat)

# Draw from multivariate normal
Rmvn <- function(mu, sigma.chol) {
    d <- length(mu)
    c(mu + t(sigma.chol) %*% rnorm(d))
}

SampleBeta <- function(sigma.2) {
    Rmvn(beta.hat, xtx.inv.chol * sqrt(sigma.2))
}

SampleSigma2 <- function() {
    1/rgamma(1, a.sigma.2, b.sigma.2)
}

# MCMC, samples saved on-disk
backing.path <- tempfile()
dir.create(backing.path)
Mcmc <- InitMcmc(1000, backing.path=backing.path)
samples <- Mcmc({
    sigma.2 <- SampleSigma2()
    beta <- SampleBeta(sigma.2)
})

# Plot residuals using predictions made from the posterior mean of beta
y.hat <- x %*% colMeans(samples$beta[,])
plot(y.hat, y-y.hat, xlab="Predicted", ylab="Residual")
abline(h=0, col="red")



