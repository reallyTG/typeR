library(bayesAB)


### Name: banditize
### Title: Create a multi-armed Bayesian bandit object.
### Aliases: banditize

### ** Examples

A_binom <- rbinom(100, 1, .5)
B_binom <- rbinom(100, 1, .6)

AB1 <- bayesTest(A_binom, B_binom, priors = c('alpha' = 1, 'beta' = 1), distribution = 'bernoulli')

binomialBandit <- banditize(AB1)
binomialBandit$serveRecipe()
binomialBandit$setResults(list('A' = c(1, 0, 1, 0, 0), 'B' = c(0, 0, 0, 0, 1)))




