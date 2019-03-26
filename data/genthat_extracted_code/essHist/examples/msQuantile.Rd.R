library(essHist)


### Name: msQuantile
### Title: Quantile of the multiscale statistics
### Aliases: msQuantile
### Keywords: distribution nonparametric

### ** Examples

n    = 100 # number of observations
nsim = 100 # number of simulations

alpha = c(0.1, 0.9) # significance level
q     = msQuantile(n, alpha, nsim)

print(q)



