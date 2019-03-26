library(robust)


### Name: glmRob.misclass
### Title: Consistent Misclassification Estimator
### Aliases: glmRob.misclass
### Keywords: robust regression

### ** Examples

data(leuk.dat)

glmRob(y ~ ag + wbc, data = leuk.dat, family = binomial(), method = 'misclass')



