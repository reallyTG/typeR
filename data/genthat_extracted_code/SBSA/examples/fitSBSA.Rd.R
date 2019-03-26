library(SBSA)


### Name: fitSBSA
### Title: Fitting Simplified Bayesian Sensitivity Models
### Aliases: fitSBSA
### Keywords: TODO

### ** Examples

### simulated data example
n <- 1000

### exposure and true confounders equi-correlated with corr=.6
tmp <- sqrt(.6)*matrix(rnorm(n),n,5) +
       sqrt(1-.6)*matrix(rnorm(n*5),n,5)
x <- tmp[,1]
z <- tmp[,2:5]

### true outcome relationship
y <- rnorm(n, x + z%*%rep(.5,4), .5)


### first two confounders are poorly measured, ICC=.7, .85
### third is correctly measured, fourth is unobserved
w <- z[,1:3]
w[,1] <- w[,1] + rnorm(n, sd=sqrt(1/.7-1))
w[,2] <- w[,2] + rnorm(n, sd=sqrt(1/.85-1))

### fitSBSA expects standardized exposure, noisy confounders
x.sdz <- (x-mean(x))/sqrt(var(x))
w.sdz <- apply(w, 2, function(x) {(x-mean(x)) / sqrt(var(x))} )

### prior information: ICC very likely above .6, mode at .8
### via Beta(5,21) distribution
fit <- fitSBSA(y, x.sdz, w.sdz, a=5, b=21, nrep=10000,
               sampler.jump=c(alpha=.02, beta.z=.03,
                              sigma.sq=.05, tau.sq=.004,
                              beta.u.gamma.x=.4, gamma.z=.5))

### check MCMC behaviour
print(fit$acc)
plot(fit$alpha[,2], pch=20)

### inference on target parameter in original scale
trgt <- fit$alpha[1001:10000,2]/sqrt(var(x))
print(c(mean(trgt), sqrt(var(trgt))))



