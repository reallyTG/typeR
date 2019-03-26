library(vimp)


### Name: cv_vim
### Title: Nonparametric Variable Importance Estimates using
###   Cross-validation
### Aliases: cv_vim

### ** Examples

## No test: 
library(SuperLearner)
library(gam)
n <- 100
p <- 2
## generate the data
x <- data.frame(replicate(p, stats::runif(n, -5, 5)))

## apply the function to the x's
smooth <- (x[,1]/5)^2*(x[,1]+7)/5 + (x[,2]/3)^2

## generate Y ~ Normal (smooth, 1)
y <- as.matrix(smooth + stats::rnorm(n, 0, 1))

## set up a library for SuperLearner
learners <- c("SL.mean", "SL.gam")

## -----------------------------------------
## using Super Learner
## -----------------------------------------
set.seed(4747)
est <- cv_vim(Y = y, X = x, indx = 2, V = 5, 
type = "regression", run_regression = TRUE, 
SL.library = learners, alpha = 0.05)

## ------------------------------------------
## doing things by hand, and plugging them in
## ------------------------------------------
## set up the folds
V <- 5
indx <- 2
set.seed(4747)
folds <- two_validation_set_cv(length(y), V)
## get the fitted values by fitting the super learner on each pair
fhat_ful <- list()
fhat_red <- list()
for (v in 1:V) {
    fhat_ful[[v]] <- list()
    fhat_red[[v]] <- list()
    ## fit super learner
    fit <- SuperLearner::SuperLearner(Y = y[folds[, v] == 0, , drop = FALSE],
     X = x[folds[, v] == 0, , drop = FALSE], SL.library = learners)
    fitted_v <- SuperLearner::predict.SuperLearner(fit)$pred
    ## get predictions on the first validation fold
    fhat_ful[[v]][[1]] <- SuperLearner::predict.SuperLearner(fit, 
     newdata = x[folds[, v] == 1, , drop = FALSE])$pred
    ## get predictions on the second validation fold
    fhat_ful[[v]][[2]] <- SuperLearner::predict.SuperLearner(fit, 
     newdata = x[folds[, v] == 2, , drop = FALSE])$pred
    ## fit the super learner on the reduced covariates
    red <- SuperLearner::SuperLearner(Y = fitted_v,
     X = x[folds[, v] == 0, -indx, drop = FALSE], SL.library = learners)
    ## get predictions on the first validation fold
    fhat_red[[v]][[1]] <- SuperLearner::predict.SuperLearner(red, 
     newdata = x[folds[, v] == 1, -indx, drop = FALSE])$pred
    ## get predictions on the second validation fold
    fhat_red[[v]][[2]] <- SuperLearner::predict.SuperLearner(red, 
     newdata = x[folds[, v] == 2, -indx, drop = FALSE])$pred  
}
est <- cv_vim(Y = y, f1 = fhat_ful, f2 = fhat_red, indx = 2,
V = 5, folds = folds, type = "regression", run_regression = FALSE, alpha = 0.05)
## End(No test)




