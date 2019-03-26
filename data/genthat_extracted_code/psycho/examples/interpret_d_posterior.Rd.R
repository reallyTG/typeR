library(psycho)


### Name: interpret_d_posterior
### Title: Standardized difference (Cohen's d) interpreation for a
###   posterior distribution.
### Aliases: interpret_d_posterior

### ** Examples

library(psycho)
posterior <- rnorm(1000, 0.6, 0.05)
interpret_d_posterior(posterior)
interpret_d_posterior(rnorm(1000, 0.1, 1))



