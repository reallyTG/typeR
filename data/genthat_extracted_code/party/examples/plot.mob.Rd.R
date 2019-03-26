library(party)


### Name: plot.mob
### Title: Visualization of MOB Trees
### Aliases: plot.mob
### Keywords: hplot

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
fm <- mob(medv ~ lstat + rm | zn + indus + chas + nox + age + dis + 
                              rad + tax + crim + b + ptratio,
  control = mob_control(minsplit = 40), data = BostonHousing, 
  model = linearModel)

## visualize medv ~ lstat and medv ~ rm
plot(fm)

## visualize only one of the two regressors
plot(fm, tp_args = list(which = "lstat"), tnex = 2)
plot(fm, tp_args = list(which = 2), tnex = 2)

## omit fitted mean lines
plot(fm, tp_args = list(fitmean = FALSE))

## mixed numerical and categorical regressors 
fm2 <- mob(medv ~ lstat + rm + chas | zn + indus + nox + age + 
                                      dis + rad,
  control = mob_control(minsplit = 100), data = BostonHousing, 
  model = linearModel)
plot(fm2)

## recursive partitioning of a logistic regression model
data("PimaIndiansDiabetes", package = "mlbench")
fmPID <- mob(diabetes ~ glucose | pregnant + pressure + triceps + 
                                  insulin + mass + pedigree + age,
  data = PimaIndiansDiabetes, model = glinearModel, 
  family = binomial())
## default plot: spinograms with breaks from five point summary
plot(fmPID)
## use the breaks from hist() instead
plot(fmPID, tp_args = list(fivenum = FALSE))
## user-defined breaks
plot(fmPID, tp_args = list(breaks = 0:4 * 50))
## CD plots instead of spinograms
plot(fmPID, tp_args = list(cdplot = TRUE))
## different smoothing bandwidth
plot(fmPID, tp_args = list(cdplot = TRUE, bw = 15))

}



