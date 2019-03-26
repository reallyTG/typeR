library(mvabund)


### Name: cv.glm1path
### Title: Fits a path of Generalised Linear Models with LASSO (or L1)
###   penalties, and finds the best model by corss-validation.
### Aliases: cv.glm1path
### Keywords: models regression

### ** Examples

data(spider)
Alopacce <- spider$abund[,1]
X <- cbind(1,spider$x)

# fit a LASSO-penalised negative binomial regression:
ft = glm1path(Alopacce,X,lam.min=0.1)
coef(ft)

# now estimate the best-fitting model by cross-validation:
cvft = cv.glm1path(ft)
coef(cvft)




