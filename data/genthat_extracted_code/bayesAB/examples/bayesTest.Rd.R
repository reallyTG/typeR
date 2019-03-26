library(bayesAB)


### Name: bayesTest
### Title: Fit a Bayesian model to A/B test data.
### Aliases: bayesTest

### ** Examples

A_binom <- rbinom(100, 1, .5)
B_binom <- rbinom(100, 1, .6)

A_norm <- rnorm(100, 6, 1.5)
B_norm <- rnorm(100, 5, 2.5)

AB1 <- bayesTest(A_binom, B_binom, 
                 priors = c('alpha' = 1, 'beta' = 1), 
                 distribution = 'bernoulli')
AB2 <- bayesTest(A_norm, B_norm,
                 priors = c('mu' = 5, 'lambda' = 1, 'alpha' = 3, 'beta' = 1), 
                 distribution = 'normal')

print(AB1)
summary(AB1)
plot(AB1)

summary(AB2)

# Create a new variable that is the probability multiiplied
# by the normally distributed variable (expected value of something)
AB3 <- combine(AB1, AB2, f = `*`, params = c('Probability', 'Mu'), newName = 'Expectation')

print(AB3)
summary(AB3)
plot(AB3)




