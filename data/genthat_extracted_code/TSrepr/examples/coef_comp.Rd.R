library(TSrepr)


### Name: coefComp
### Title: Functions for linear regression model coefficients extraction
### Aliases: coefComp lmCoef rlmCoef l1Coef

### ** Examples

design_matrix <- matrix(rnorm(10), ncol = 2)
lmCoef(design_matrix, rnorm(5))

rlmCoef(design_matrix, rnorm(5))

l1Coef(design_matrix, rnorm(5))




