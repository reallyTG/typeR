library(modi)


### Name: BEM
### Title: BACON-EEM Algorithm for multivariate outlier detection in
###   incomplete multivariate survey data
### Aliases: BEM

### ** Examples

# Bushfire data set with 20% MCAR
data(bushfirem, bushfire.weights)
bem.res <- BEM(bushfirem, bushfire.weights, alpha = (1 - 0.01 / nrow(bushfirem)))
print(bem.res$output)



