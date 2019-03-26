library(ciTools)


### Name: add_quantile.glm
### Title: Quantiles for the Response of a Generalized Linear Model
### Aliases: add_quantile.glm

### ** Examples


# Fit a Poisson GLM
fit <- glm(dist ~ speed, data = cars, family = "poisson")

# What is the 0.3-quantile (or 30th percentile) of new distances,
# given the Poisson model?
add_quantile(cars, fit, p = 0.3)

# As above, but now find the 0.5-quantile (50th percentile), change
# the number of simulations to run, and give the vector of
# quantiles a custom name.
add_quantile(cars, fit, p = 0.5, name = "my_quantile", nSims = 300)





