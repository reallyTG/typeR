library(psycho)


### Name: interpret_odds_posterior
### Title: Odds ratio interpreation for a posterior distribution.
### Aliases: interpret_odds_posterior

### ** Examples

library(psycho)
posterior <- rnorm(1000, 0.6, 0.05)
interpret_odds_posterior(posterior)
interpret_odds_posterior(rnorm(1000, 0.1, 1))
interpret_odds_posterior(rnorm(1000, 3, 1.5))



