## ---- echo = FALSE, include = FALSE--------------------------------------
library(knitr)
opts_knit$set(cache = FALSE, verbose = TRUE, global.par = TRUE)

## ----echo = FALSE--------------------------------------------------------
par(mar = c(5, 12, 4, 2) + 0.1)

## ------------------------------------------------------------------------
## load the library, view the data
library(MASS)
data(Boston)
head(Boston)

## ------------------------------------------------------------------------
## estimate the full conditional mean using linear regression
full.mod <- lm(medv ~ ., data = Boston)
full.fit <- predict(full.mod)

## estimate the reduced conditional means for each of the individual variables
X <- as.matrix(Boston[, -14]) # remove the outcome for the predictor matrix

red.mod.crim <- lm(full.fit ~ X[,-1])
red.fit.crim <- predict(red.mod.crim)

red.mod.zn <- lm(full.fit ~ X[,-2])
red.fit.zn <- predict(red.mod.zn)

red.mod.indus <- lm(full.fit ~ X[,-3])
red.fit.indus <- predict(red.mod.indus)

red.mod.chas <- lm(full.fit ~ X[,-4])
red.fit.chas <- predict(red.mod.chas)

red.mod.nox <- lm(full.fit ~ X[,-5])
red.fit.nox <- predict(red.mod.nox)

red.mod.rm <- lm(full.fit ~ X[, -6])
red.fit.rm <- predict(red.mod.rm)

red.mod.age <- lm(full.fit ~ X[,-7])
red.fit.age <- predict(red.mod.age)

red.mod.dis <- lm(full.fit ~ X[, -8])
red.fit.dis <- predict(red.mod.dis)

red.mod.rad <- lm(full.fit ~ X[,-9])
red.fit.rad <- predict(red.mod.rad)

red.mod.tax <- lm(full.fit ~ X[,-10])
red.fit.tax <- predict(red.mod.tax)

red.mod.ptratio <- lm(full.fit ~ X[,-11])
red.fit.ptratio <- predict(red.mod.ptratio)

red.mod.black <- lm(full.fit ~ X[,-12])
red.fit.black <- predict(red.mod.black)

red.mod.lstat <- lm(full.fit ~ X[,-13])
red.fit.lstat <- predict(red.mod.lstat)

## load the library
library(vimp)

## plug these into vim
lm.vim.crim <- vim(full.fit, red.fit.crim, y = Boston$medv)
lm.vim.zn <- vim(full.fit, red.fit.zn, y = Boston$medv)
lm.vim.indus <- vim(full.fit, red.fit.indus, y = Boston$medv)
lm.vim.chas <- vim(full.fit, red.fit.chas, y = Boston$medv)
lm.vim.nox <- vim(full.fit, red.fit.nox, y = Boston$medv)
lm.vim.rm <- vim(full.fit, red.fit.rm, y = Boston$medv)
lm.vim.age <- vim(full.fit, red.fit.age, y = Boston$medv)
lm.vim.dis <- vim(full.fit, red.fit.dis, y = Boston$medv)
lm.vim.rad <- vim(full.fit, red.fit.rad, y = Boston$medv)
lm.vim.tax <- vim(full.fit, red.fit.tax, y = Boston$medv)
lm.vim.ptratio <- vim(full.fit, red.fit.ptratio, y = Boston$medv)
lm.vim.black <- vim(full.fit, red.fit.black, y = Boston$medv)
lm.vim.lstat <- vim(full.fit, red.fit.lstat, y = Boston$medv)

## make a table with the estimates using the merge_vim() function
lm.mat <- merge_vim(lm.vim.crim, lm.vim.zn, lm.vim.indus, lm.vim.chas,
                lm.vim.nox, lm.vim.rm, lm.vim.age, lm.vim.dis, lm.vim.rad,
                lm.vim.tax, lm.vim.ptratio, lm.vim.black, lm.vim.lstat)
## print out the matrix
lm.mat$mat

## ------------------------------------------------------------------------
## load the library
library(SuperLearner)

## create a function for boosted stumps
SL.gbm.1 <- function(..., interaction.depth = 1) SL.gbm(..., interaction.depth = interaction.depth)

## create GAMs with different degrees of freedom
SL.gam.3 <- function(..., deg.gam = 3) SL.gam(..., deg.gam = deg.gam)
SL.gam.4 <- function(..., deg.gam = 4) SL.gam(..., deg.gam = deg.gam)
SL.gam.5 <- function(..., deg.gam = 5) SL.gam(..., deg.gam = deg.gam)

## add more levels of alpha for glmnet
create.SL.glmnet <- function(alpha = c(0.25, 0.5, 0.75)) {
  for (mm in seq(length(alpha))) {
    eval(parse(file = "", text = paste('SL.glmnet.', alpha[mm], '<- function(..., alpha = ', alpha[mm], ') SL.glmnet(..., alpha = alpha)', sep = '')), envir = .GlobalEnv)
  }
  invisible(TRUE)
}
create.SL.glmnet()

## add tuning parameters for randomForest
create.SL.randomForest <- function(tune = list(mtry = c(1, 5, 7), nodesize = c(1, 5, 10))) {
  tuneGrid <- expand.grid(tune, stringsAsFactors = FALSE)
  for (mm in seq(nrow(tuneGrid))) {
    eval(parse(file = "", text = paste("SL.randomForest.", mm, "<- function(..., mtry = ", tuneGrid[mm, 1], ", nodesize = ", tuneGrid[mm, 2], ") SL.randomForest(..., mtry = mtry, nodesize = nodesize)", sep = "")), envir = .GlobalEnv)
  }
  invisible(TRUE)
}
create.SL.randomForest()

## create the library
learners <- c("SL.gam", "SL.gam.3", "SL.gam.4", "SL.gam.5",
              "SL.glmnet", "SL.glmnet.0.25", "SL.glmnet.0.5", "SL.glmnet.0.75",
              "SL.randomForest", "SL.randomForest.1", "SL.randomForest.2", "SL.randomForest.3",
              "SL.randomForest.4", "SL.randomForest.5", "SL.randomForest.6", "SL.randomForest.7",
              "SL.randomForest.8", "SL.randomForest.9",
              "SL.gbm.1")

## ---- eval = FALSE-------------------------------------------------------
#  ## load the library
#  library(vimp)
#  
#  ## first re-order the data so that the outcome is in the first column
#  Boston2 <- Boston[, 1:13]
#  Boston3 <- cbind(medv = Boston$medv, Boston2)
#  
#  ## now estimate variable importance
#  vim(f1 = y ~ x, f2 = fit ~ x, data = Boston3, y = Boston3[, 1],
#      indx = 5, SL.library = learners)

## ------------------------------------------------------------------------
## load the library
library(vimp)

## first re-order the data so that the outcome is in the first column
Boston2 <- Boston[, 1:13]
Boston3 <- cbind(medv = Boston$medv, Boston2)

## new learners library, with only one learner for illustration only
learners.2 <- c("SL.gam", "SL.glmnet")

## now estimate variable importance
nox.vim <- vim(f1 = y ~ x, f2 = fit ~ x, data = Boston3, y = Boston3$medv, indx = 5, SL.library = learners.2)

## ------------------------------------------------------------------------
nox.vim

## ------------------------------------------------------------------------
head(nox.vim$full.fit)
head(nox.vim$red.fit)

## ------------------------------------------------------------------------
## specify that full.fit doesn't change
full.fit <- nox.vim$full.fit

## estimate variable importance for the average number of rooms
rm.vim <- vim(full.fit, f2 = fit ~ x, data = Boston3, y = Boston3$medv,
              indx = 6, SL.library = learners.2)

rm.vim

## ------------------------------------------------------------------------
## set up the data
y <- Boston$medv
x <- Boston[, -c(8, 14)] # this removes dis and medv

## fit a GAM and glmnet using SuperLearner, using the two-step estimating procedure
reduced.mod <- SuperLearner(Y = full.fit, X = x, SL.library = learners.2)
reduced.fit <- predict(reduced.mod)$pred
## this takes 2 seconds

## estimate variable importance
dis.vim <- vim(full.fit, reduced.fit, y = Boston3$medv, indx = 8)

## ------------------------------------------------------------------------
crim.vim <- vim(full.fit, fit ~ x, data = Boston3, y = Boston3$medv,
                indx = 1, SL.library = learners.2)
zn.vim <- vim(full.fit, fit ~ x, data = Boston3, y = Boston3$medv,
                indx = 2, SL.library = learners.2)
indus.vim <- vim(full.fit, fit ~ x, data = Boston3, y = Boston3$medv,
                indx = 3, SL.library = learners.2)
chas.vim <- vim(full.fit, fit ~ x, data = Boston3, y = Boston3$medv,
                indx = 4, SL.library = learners.2)
age.vim <- vim(full.fit, fit ~ x, data = Boston3, y = Boston3$medv,
                indx = 7, SL.library = learners.2)
rad.vim <- vim(full.fit, fit ~ x, data = Boston3, y = Boston3$medv,
                indx = 9, SL.library = learners.2)
tax.vim <- vim(full.fit, fit ~ x, data = Boston3, y = Boston3$medv,
                indx = 10, SL.library = learners.2)
ptratio.vim <- vim(full.fit, fit ~ x, data = Boston3, y = Boston3$medv,
                indx = 11, SL.library = learners.2)
black.vim <- vim(full.fit, fit ~ x, data = Boston3, y = Boston3$medv,
                indx = 12, SL.library = learners.2)
lstat.vim <- vim(full.fit, fit ~ x, data = Boston3, y = Boston3$medv,
                indx = 13, SL.library = learners.2)

## ---- fig.width = 8.5, fig.height = 8------------------------------------
## combine the objects together
ests <- merge_vim(crim.vim, zn.vim, indus.vim, chas.vim,
                nox.vim, rm.vim, age.vim, dis.vim, rad.vim,
                tax.vim, ptratio.vim, black.vim, lstat.vim)

## create a vector of names; must be in the same order as the
## mat object in ests
nms <- c("Prop. lower status", "Avg. num. rooms", "Pupil-teacher ratio", "Nitrogen oxide", "Distance", "Crime", "Access to radial hwys", "Property tax rate", "Charles riv.", "Prop. black", "Prop. business", "Prop. large zoned", "Age")

## plot
plot(ests, nms, pch = 16, ylab = "", xlab = "Estimate", main = "Estimated variable importance for individual features", xlim = c(0, 0.2))

## ---- fig.width = 8.5, fig.height = 8------------------------------------
## get the estimates
structure.vim <- vim(full.fit, fit ~ x, data = Boston3, y = Boston3$medv,
                indx = c(6, 7), SL.library = learners.2)
access.vim <- vim(full.fit, fit ~ x, data = Boston3, y = Boston3$medv,
                indx = c(8, 9), SL.library = learners.2)
neigh.vim <- vim(full.fit, fit ~ x, data = Boston3, y = Boston3$medv,
                indx = c(1, 2, 3, 4, 10, 11, 12, 13), SL.library = learners.2)

## combine and plot
groups <- merge_vim(structure.vim, access.vim, neigh.vim, nox.vim)
nms.2 <- c("Neighborhood", "Structure", "Accessibility", "Nitrogen oxide")
plot(groups, nms.2, pch = 16, ylab = "", xlab = "Estimate", main = "Estimated variable importance for groups", xlim = c(0, 0.5))

