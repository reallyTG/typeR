library(PCovR)


### Name: pcovr_est
### Title: Estimation of Principal Covariates Regression parameters, given
###   a prespecified weighting value and number of components
### Aliases: pcovr_est
### Keywords: regression

### ** Examples

data(alexithymia)
X <- data.matrix(alexithymia$X)
Y <- data.matrix(alexithymia$Y)
results <- pcovr_est(X, Y, r=2, a=.90)
str(results)



