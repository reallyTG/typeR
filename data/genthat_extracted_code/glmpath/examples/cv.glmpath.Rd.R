library(glmpath)


### Name: cv.glmpath
### Title: Computes cross-validated (minus) log-likelihoods or prediction
###   errors for glmpath
### Aliases: cv.glmpath
### Keywords: models regression

### ** Examples

data(heart.data)
attach(heart.data)
cv.a <- cv.glmpath(x, y, family=binomial)
cv.b <- cv.glmpath(x, y, family=binomial, type="response")
detach(heart.data)



