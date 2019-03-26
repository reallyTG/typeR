library(Bolstad)


### Name: mean.Bolstad
### Title: Calculate the posterior mean
### Aliases: mean.Bolstad

### ** Examples

# The useful of this method is really highlighted when we have a general 
# continuous prior. In this example we are interested in the posterior mean of 
# an normal mean. Our prior is triangular over [-3, 3]
set.seed(123)
x = rnorm(20, -0.5, 1)
mu = seq(-3, 3, by = 0.001)
mu.prior = rep(0, length(mu))
mu.prior[mu <= 0] = 1 / 3 + mu[mu <= 0] / 9
mu.prior[mu > 0] = 1 / 3 - mu[mu > 0] / 9
results = normgcp(x, 1, density = "user", mu = mu, mu.prior = mu.prior)
mean(results)



