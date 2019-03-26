library(AssocTests)


### Name: max3
### Title: Maximum Test: maximum value of the three Cochran-Armitage trend
###   tests under the recessive, additive, and dominant models
### Aliases: max3

### ** Examples

y <- rep(c(0, 1), 5)
g <- sample(c(0, 1, 2), 10, replace = TRUE)
max3(y, g, covariates = NULL, Score.test = TRUE, Wald.test = FALSE,
       rhombus.formula = FALSE)
max3(y, g, covariates = matrix(sample(c(0,1), 20, replace = TRUE), ncol=2),
       Score.test = TRUE, Wald.test = FALSE, rhombus.formula = FALSE)



