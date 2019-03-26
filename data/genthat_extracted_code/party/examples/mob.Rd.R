library(party)


### Name: mob
### Title: Model-based Recursive Partitioning
### Aliases: mob mob-class coef.mob deviance.mob fitted.mob logLik.mob
###   predict.mob print.mob residuals.mob sctest.mob summary.mob
###   weights.mob
### Keywords: tree

### ** Examples


set.seed(290875)

if(require("mlbench")) {

## recursive partitioning of a linear regression model
## load data
data("BostonHousing", package = "mlbench")
## and transform variables appropriately (for a linear regression)
BostonHousing$lstat <- log(BostonHousing$lstat)
BostonHousing$rm <- BostonHousing$rm^2
## as well as partitioning variables (for fluctuation testing)
BostonHousing$chas <- factor(BostonHousing$chas, levels = 0:1, 
                             labels = c("no", "yes"))
BostonHousing$rad <- factor(BostonHousing$rad, ordered = TRUE)

## partition the linear regression model medv ~ lstat + rm
## with respect to all remaining variables:
fmBH <- mob(medv ~ lstat + rm | zn + indus + chas + nox + age + 
                                dis + rad + tax + crim + b + ptratio,
  control = mob_control(minsplit = 40), data = BostonHousing, 
  model = linearModel)

## print the resulting tree
fmBH
## or better visualize it
plot(fmBH)

## extract coefficients in all terminal nodes
coef(fmBH)
## look at full summary, e.g., for node 7
summary(fmBH, node = 7)
## results of parameter stability tests for that node
sctest(fmBH, node = 7)
## -> no further significant instabilities (at 5% level)

## compute mean squared error (on training data)
mean((BostonHousing$medv - fitted(fmBH))^2)
mean(residuals(fmBH)^2)
deviance(fmBH)/sum(weights(fmBH))

## evaluate logLik and AIC
logLik(fmBH)
AIC(fmBH)
## (Note that this penalizes estimation of error variances, which
## were treated as nuisance parameters in the fitting process.)


## recursive partitioning of a logistic regression model
## load data
data("PimaIndiansDiabetes", package = "mlbench")
## partition logistic regression diabetes ~ glucose 
## wth respect to all remaining variables
fmPID <- mob(diabetes ~ glucose | pregnant + pressure + triceps + 
                                  insulin + mass + pedigree + age,
  data = PimaIndiansDiabetes, model = glinearModel, 
  family = binomial())

## fitted model
coef(fmPID)
plot(fmPID)
plot(fmPID, tp_args = list(cdplot = TRUE))
}



