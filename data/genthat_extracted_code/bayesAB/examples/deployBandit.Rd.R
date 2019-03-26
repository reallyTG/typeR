library(bayesAB)


### Name: deployBandit
### Title: Deploy a bayesBandit object as a JSON API.
### Aliases: deployBandit

### ** Examples

A_binom <- rbinom(100, 1, .5)
B_binom <- rbinom(100, 1, .6)

AB1 <- bayesTest(A_binom, B_binom, priors = c('alpha' = 1, 'beta' = 1), distribution = 'bernoulli')

binomialBandit <- banditize(AB1)
## Not run: deployBandit(binomialBandit)




