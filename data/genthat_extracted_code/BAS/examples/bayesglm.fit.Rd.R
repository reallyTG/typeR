library(BAS)


### Name: bayesglm.fit
### Title: Fitting Generalized Linear Models and Bayesian marginal
###   likelihood evaluation
### Aliases: bayesglm.fit
### Keywords: GLM regression

### ** Examples

data(Pima.tr, package="MASS")
Y <- as.numeric(Pima.tr$type) - 1
X <- cbind(1, as.matrix(Pima.tr[,1:7]))
out <- bayesglm.fit(X, Y, family=binomial(),coefprior=bic.prior(n=length(Y)))
out$coef
out$se
# using built in function
glm(type ~ ., family=binomial(), data=Pima.tr)




