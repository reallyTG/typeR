library(MASS)


### Name: negative.binomial
### Title: Family function for Negative Binomial GLMs
### Aliases: negative.binomial
### Keywords: regression models

### ** Examples

# Fitting a Negative Binomial model to the quine data
#   with theta = 2 assumed known.
#
glm(Days ~ .^4, family = negative.binomial(2), data = quine)



