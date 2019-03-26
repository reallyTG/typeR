library(mixlink)


### Name: Metropolis-within-Gibbs Sampler
### Title: Metropolis-within-Gibbs Sampler
### Aliases: 'Metropolis-within-Gibbs Sampler' gibbs.mixlink

### ** Examples

# ----- Generate data -----
n <- 200
m <- rep(20, n)
x <- rnorm(n, 0, 1)
X <- model.matrix(~ x)
Beta.true <- c(-1, 1)
mean.true <- plogis(X %*% Beta.true)
kappa.true <- 1
Pi.true <- c(1,3)/4
d <- ncol(X)
J <- length(Pi.true)
y <- r.mixlink.binom(n, mean.true, Pi.true, kappa.true, m)

# ----- Run Metropolis-within-Gibbs sampler -----
hyper <- list(VBeta = diag(1000, d), alpha.Pi = rep(1, J),
	kappa.a = 1, kappa.b = 1/2)
gibbs.out <- gibbs.mixlink(y, X, R = 10, burn = 5, thin = 1,
	invlink = plogis, report.period = 100, Pi.init = c(1,9)/10,
	proposal.VBeta = solve(t(X) %*% X), proposal.VPi = diag(0.25^2, J-1),
	proposal.Vkappa = 0.5^2, proposal.Vpsi = diag(0.5^2, J),
	hyper = hyper, family = "binomial", trials = m)

print(gibbs.out)
DIC(gibbs.out)




