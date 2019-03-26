library(glmpath)


### Name: glmpath
### Title: Fits the entire L1 regularization path for generalized linear
###   models
### Aliases: glmpath
### Keywords: models regression

### ** Examples

data(heart.data)
attach(heart.data)
fit.a <- glmpath(x, y, family=binomial)
fit.b <- glmpath(x, y, family=gaussian)
detach(heart.data)



