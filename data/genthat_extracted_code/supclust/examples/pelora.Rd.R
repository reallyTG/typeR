library(supclust)


### Name: pelora
### Title: Supervised Grouping of Predictor Variables
### Aliases: pelora
### Keywords: classif cluster

### ** Examples

## Working with a "real" microarray dataset
data(leukemia, package="supclust")

## Generating random test data: 3 observations and 250 variables (genes)
set.seed(724)
xN <- matrix(rnorm(750), nrow = 3, ncol = 250)

## Fitting Pelora
fit <- pelora(leukemia.x, leukemia.y, noc = 3)

## Working with the output
fit
summary(fit)
plot(fit)
fitted(fit)
coef(fit)

## Fitted values and class probabilities for the training data
predict(fit, type = "cla")
predict(fit, type = "prob")

## Predicting fitted values and class labels for the random test data
predict(fit, newdata = xN)
predict(fit, newdata = xN, type = "cla", noc = c(1,2,3))
predict(fit, newdata = xN, type = "pro", noc = c(1,3))

## Fitting Pelora such that the first 70 variables (genes) are not grouped
fit <- pelora(leukemia.x[, -(1:70)], leukemia.y, leukemia.x[,1:70])

## Working with the output
fit
summary(fit)
plot(fit)
fitted(fit)
coef(fit)

## Fitted values and class probabilities for the training data
predict(fit, type = "cla")
predict(fit, type = "prob")

## Predicting fitted values and class labels for the random test data
predict(fit, newdata = xN[, -(1:70)], newclin = xN[, 1:70])
predict(fit, newdata = xN[, -(1:70)], newclin = xN[, 1:70], "cla", noc  = 1:10)
predict(fit, newdata = xN[, -(1:70)], newclin = xN[, 1:70], type = "pro")



