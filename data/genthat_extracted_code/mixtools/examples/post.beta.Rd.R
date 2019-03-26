library(mixtools)


### Name: post.beta
### Title: Summary of Posterior Regression Coefficients in Mixtures of
###   Random Effects Regressions
### Aliases: post.beta
### Keywords: internal

### ** Examples

## EM output for simulated data from 2-component mixture of random effects.

data(RanEffdata)
set.seed(100)
x <- lapply(1:length(RanEffdata), function(i) 
            matrix(RanEffdata[[i]][, 2:3], ncol = 2))
x <- x[1:20]
y <- lapply(1:length(RanEffdata), function(i) 
            matrix(RanEffdata[[i]][, 1], ncol = 1))
y <- y[1:20]
lambda <- c(0.45, 0.55)
mu <- matrix(c(0, 4, 100, 12), 2, 2)
sigma <- 2
R <- list(diag(1, 2), diag(1, 2))
em.out <- regmixEM.mixed(y, x, sigma = sigma, arb.sigma = FALSE,
                         lambda = lambda, mu = mu, R = R,
                         addintercept.random = FALSE,
                         epsilon = 1e-02, verb = TRUE)

## Obtaining the 2x2 matrix of plots.

x.ran <- lapply(1:length(x), function(i) x[[i]][, 2])
p.beta <- em.out$posterior.beta
p.z <- em.out$posterior.z
post.beta(y, x.ran, p.beta = p.beta, p.z = p.z)



