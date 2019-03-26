library(partykit)


### Name: mob
### Title: Model-based Recursive Partitioning
### Aliases: mob modelparty coef.modelparty deviance.modelparty
###   fitted.modelparty formula.modelparty getCall.modelparty
###   logLik.modelparty model.frame.modelparty nobs.modelparty
###   plot.modelparty predict.modelparty print.modelparty
###   residuals.modelparty summary.modelparty weights.modelparty
###   refit.modelparty sctest.modelparty
### Keywords: tree

### ** Examples

if(require("mlbench")) {

## Pima Indians diabetes data
data("PimaIndiansDiabetes", package = "mlbench")

## a simple basic fitting function (of type 1) for a logistic regression
logit <- function(y, x, start = NULL, weights = NULL, offset = NULL, ...) {
  glm(y ~ 0 + x, family = binomial, start = start, ...)
}

## set up a logistic regression tree
pid_tree <- mob(diabetes ~ glucose | pregnant + pressure + triceps + insulin +
  mass + pedigree + age, data = PimaIndiansDiabetes, fit = logit)
## see lmtree() and glmtree() for interfaces with more efficient fitting functions

## print tree
print(pid_tree)

## print information about (some) nodes
print(pid_tree, node = 3:4)

## visualization
plot(pid_tree)

## coefficients and summary
coef(pid_tree)
coef(pid_tree, node = 1)
summary(pid_tree, node = 1)

## average deviance computed in different ways
mean(residuals(pid_tree)^2)
deviance(pid_tree)/sum(weights(pid_tree))
deviance(pid_tree)/nobs(pid_tree)

## log-likelihood and information criteria
logLik(pid_tree)
AIC(pid_tree)
BIC(pid_tree)

## predicted nodes
predict(pid_tree, newdata = head(PimaIndiansDiabetes, 6), type = "node")
## other types of predictions are possible using lmtree()/glmtree()
}



