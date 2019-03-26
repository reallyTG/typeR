library(robust)


### Name: glmRob.mallows
### Title: Mallows Type Estimator
### Aliases: glmRob.mallows
### Keywords: robust regression

### ** Examples

data(mallows.dat)

glmRob(y ~ a + b + c, data = mallows.dat, family = binomial(), method = 'mallows')



