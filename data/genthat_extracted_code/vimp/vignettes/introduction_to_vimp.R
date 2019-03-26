## ---- echo = FALSE, include = FALSE--------------------------------------
library(knitr)
opts_knit$set(cache = FALSE, verbose = TRUE, global.par = TRUE)

## ----echo = FALSE--------------------------------------------------------
par(mar = c(5, 12, 4, 2) + 0.1)

## ---- eval = FALSE-------------------------------------------------------
#  # only run if you don't have devtools
#  # previously installed
#  # install.packages("devtools")
#  devtools::install_github("bdwilliamson/vimp")

## ------------------------------------------------------------------------
library("vimp")

## ------------------------------------------------------------------------
## -------------------------------------------------------------
## problem setup
## -------------------------------------------------------------
## set up the data
n <- 100
p <- 2
s <- 1 # desire importance for X_1
x <- data.frame(replicate(p, runif(n, -1, 1)))
y <- (x[,1])^2*(x[,1]+7/5) + (25/9)*(x[,2])^2 + rnorm(n, 0, 1) 

## ------------------------------------------------------------------------
library("SuperLearner")
## load specific algorithms
library("gam")
library("xgboost")

## ------------------------------------------------------------------------
est_1 <- vimp_regression(Y = y, X = x, indx = 1, run_regression = TRUE, 
SL.library = c("SL.gam", "SL.xgboost", "SL.mean"))

## ------------------------------------------------------------------------
est_1
print(est_1)

## ------------------------------------------------------------------------
## load the library, view the data
library("MASS")
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
library("vimp")

## plug these into vim
lm.vim.crim <- vimp_regression(Y = Boston$medv, f1 = full.fit, f2 = red.fit.crim, indx = 1, run_regression = FALSE)
lm.vim.zn <- vimp_regression(Y = Boston$medv, f1 = full.fit, f2 = red.fit.zn, indx = 2, run_regression = FALSE)
lm.vim.indus <- vimp_regression(Y = Boston$medv, f1 = full.fit, f2 = red.fit.indus, indx = 3, run_regression = FALSE)
lm.vim.chas <- vimp_regression(Y = Boston$medv, f1 = full.fit, f2 = red.fit.chas, indx = 4, run_regression = FALSE)
lm.vim.nox <- vimp_regression(Y = Boston$medv, f1 = full.fit, f2 = red.fit.nox, indx = 5, run_regression = FALSE)
lm.vim.rm <- vimp_regression(Y = Boston$medv, f1 = full.fit, f2 = red.fit.rm, indx = 6, run_regression = FALSE)
lm.vim.age <- vimp_regression(Y = Boston$medv, f1 = full.fit, f2 = red.fit.age, indx = 7, run_regression = FALSE)
lm.vim.dis <- vimp_regression(Y = Boston$medv, f1 = full.fit, f2 = red.fit.dis, indx = 8, run_regression = FALSE)
lm.vim.rad <- vimp_regression(Y = Boston$medv, f1 = full.fit, f2 = red.fit.rad, indx = 9, run_regression = FALSE)
lm.vim.tax <- vimp_regression(Y = Boston$medv, f1 = full.fit, f2 = red.fit.tax, indx = 10, run_regression = FALSE)
lm.vim.ptratio <- vimp_regression(Y = Boston$medv, f1 = full.fit, f2 = red.fit.ptratio, indx = 11, run_regression = FALSE)
lm.vim.black <- vimp_regression(Y = Boston$medv, f1 = full.fit, f2 = red.fit.black, indx = 12, run_regression = FALSE)
lm.vim.lstat <- vimp_regression(Y = Boston$medv, f1 = full.fit, f2 = red.fit.lstat, indx = 13, run_regression = FALSE)

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
#  library("vimp")
#  
#  ## first re-order the data so that the outcome is in the first column
#  Boston2 <- Boston[, 1:13]
#  
#  ## now estimate variable importance
#  vimp_regression(Y = Boston$medv, X = Boston2[, -1, drop = FALSE],
#      indx = 5, run_regression = TRUE, SL.library = learners)

## ---- message = FALSE----------------------------------------------------
## load the library
library("vimp")

## first re-order the data so that the outcome is in the first column
Boston2 <- Boston[, 1:13]

## new learners library, with only one learner for illustration only
learners.2 <- c("SL.gam", "SL.glmnet")

## now estimate variable importance
nox.vim <- vimp_regression(Y = Boston$medv, X = Boston2[, -1, drop = FALSE], 
    indx = 5, run_regression = TRUE, SL.library = learners.2)

## ------------------------------------------------------------------------
nox.vim

## ------------------------------------------------------------------------
head(nox.vim$full_fit)
head(nox.vim$red_fit)

## ---- message = FALSE----------------------------------------------------
## specify that full.fit doesn't change
full.fit <- nox.vim$full_fit

## estimate variable importance for the average number of rooms
reduced_fit <- SuperLearner::SuperLearner(Y = full.fit, X = Boston2[, -c(1, 6), drop = FALSE], SL.library = learners.2)
red.fit <- predict(reduced_fit)$pred
rm.vim <- vimp_regression(Y = Boston$medv, f1 = full.fit, f2 = red.fit, indx = 6, run_regression = FALSE)

rm.vim

## ------------------------------------------------------------------------
## set up the data
x <- Boston[, -c(8, 14)] # this removes dis and medv

## fit a GAM and glmnet using SuperLearner
reduced.mod <- SuperLearner(Y = full.fit, X = x, SL.library = learners.2)
reduced.fit <- predict(reduced.mod)$pred
## this takes 2 seconds

## estimate variable importance
dis.vim <- vimp_regression(Y = Boston$medv, f1 = full.fit, f2 = reduced.fit, indx = 8, run_regression = FALSE)

## ------------------------------------------------------------------------
reduced_crim <- predict(SuperLearner(Y = full.fit, X = Boston[, -c(1, 14)], SL.library = learners.2))$pred
crim.vim <- vimp_regression(Y = Boston$medv, f1 = full.fit, f2 = reduced_crim,
                indx = 1, run_regression = FALSE)

reduced_zn <- predict(SuperLearner(Y = full.fit, X = Boston[, -c(2, 14)], SL.library = learners.2))$pred
zn.vim <- vimp_regression(Y = Boston$medv, f1 = full.fit, f2 = reduced_zn,
                indx = 2, run_regression = FALSE)

reduced_indus <- predict(SuperLearner(Y = full.fit, X = Boston[, -c(3, 14)], SL.library = learners.2))$pred
indus.vim <- vimp_regression(Y = Boston$medv, f1 = full.fit, f2 = reduced_indus,
                indx = 3, run_regression = FALSE)

reduced_chas <- predict(SuperLearner(Y = full.fit, X = Boston[, -c(4, 14)], SL.library = learners.2))$pred
chas.vim <- vimp_regression(Y = Boston$medv, f1 = full.fit, f2 = reduced_chas,
                indx = 4, run_regression = FALSE)

reduced_age <- predict(SuperLearner(Y = full.fit, X = Boston[, -c(7, 14)], SL.library = learners.2))$pred
age.vim <- vimp_regression(Y = Boston$medv, f1 = full.fit, f2 = reduced_age,
                indx = 7, run_regression = FALSE)

reduced_rad <- predict(SuperLearner(Y = full.fit, X = Boston[, -c(9, 14)], SL.library = learners.2))$pred
rad.vim <- vimp_regression(Y = Boston$medv, f1 = full.fit, f2 = reduced_rad,
                indx = 9, run_regression = FALSE)

reduced_tax <- predict(SuperLearner(Y = full.fit, X = Boston[, -c(10, 14)], SL.library = learners.2))$pred
tax.vim <- vimp_regression(Y = Boston$medv, f1 = full.fit, f2 = reduced_tax,
                indx = 10, run_regression = FALSE)

reduced_ptratio <- predict(SuperLearner(Y = full.fit, X = Boston[, -c(11, 14)], SL.library = learners.2))$pred
ptratio.vim <- vimp_regression(Y = Boston$medv, f1 = full.fit, f2 = reduced_ptratio,
                indx = 11, run_regression = FALSE)

reduced_black <- predict(SuperLearner(Y = full.fit, X = Boston[, -c(12, 14)], SL.library = learners.2))$pred
black.vim <- vimp_regression(Y = Boston$medv, f1 = full.fit, f2 = reduced_black,
                indx = 12, run_regression = FALSE)

reduced_lstat <- predict(SuperLearner(Y = full.fit, X = Boston[, -c(13, 14)], SL.library = learners.2))$pred
lstat.vim <- vimp_regression(Y = Boston$medv, f1 = full.fit, f2 = reduced_lstat,
                indx = 13, run_regression = FALSE)

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
reduced_struct <- predict(SuperLearner(Y = Boston$medv, X = Boston[, -c(6, 7, 14)], SL.library = learners.2))$pred
structure.vim <- vimp_regression(Y = Boston$medv, f1 = full.fit, f2 = reduced_struct, indx = c(6, 7), run_regression = FALSE)

reduced_access <- predict(SuperLearner(Y = Boston$medv, X = Boston[, -c(8, 9, 14)], SL.library = learners.2))$pred
access.vim <- vimp_regression(Y = Boston$medv, f1 = full.fit, f2 = reduced_access, indx = c(8, 9), run_regression = FALSE)

reduced_neigh <- predict(SuperLearner(Y = Boston$medv, X = Boston[, -c(1, 2, 3, 4, 10, 11, 12, 13, 14)], SL.library = learners.2))$pred
neigh.vim <- vimp_regression(Y = Boston$medv, f1 = full.fit, f2 = reduced_access,
                indx = c(1, 2, 3, 4, 10, 11, 12, 13), run_regression = FALSE)

## combine and plot
groups <- merge_vim(structure.vim, access.vim, neigh.vim, nox.vim)
nms.2 <- c("Neighborhood", "Structure", "Accessibility", "Nitrogen oxide")
plot(groups, nms.2, pch = 16, ylab = "", xlab = "Estimate", main = "Estimated variable importance for groups", xlim = c(0, 0.5))

