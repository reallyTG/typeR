library(rcc)


### Name: par_bs_ci
### Title: Parametric bootstrapped confidence intervals to control RCC
### Aliases: par_bs_ci

### ** Examples

#generate 100 fake parameter estimates
theta <- c(rep(0, 90), rnorm(n=10)) #vector of means
beta <- rnorm(n=100, mean=theta, sd=1)
cis <- par_bs_ci(beta=beta, n.rep=500) #calculate parametric bootstrap confidence intervals
head(cis)



