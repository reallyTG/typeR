library(sklarsomega)


### Name: sklars.omega.bayes
### Title: Do Bayesian inference for Sklar's Omega.
### Aliases: sklars.omega.bayes

### ** Examples

## No test: 
# Fit a subset of the cartilage data, assuming a Laplace marginal distribution. Compute
# 95% HPD intervals. Show the acceptance rates for the three parameters.

data(cartilage)
data = as.matrix(cartilage)[1:100, ]
colnames(data) = c("c.1.1", "c.2.1")
set.seed(111111)
fit1 = sklars.omega.bayes(data, verbose = FALSE,
                          control = list(dist = "laplace", minit = 1000, maxit = 5000, tol = 0.01,
                                         sigma.1 = 1, sigma.2 = 0.1, sigma.omega = 0.2))
summary(fit1)
fit1$accept

# Now assume a t marginal distribution.

set.seed(4565)
fit2 = sklars.omega.bayes(data, verbose = FALSE,
                          control = list(dist = "t", minit = 1000, maxit = 5000, tol = 0.01,
                                         sigma.1 = 0.2, sigma.2 = 2, sigma.omega = 0.2))
summary(fit2)
fit2$accept
## End(No test)



