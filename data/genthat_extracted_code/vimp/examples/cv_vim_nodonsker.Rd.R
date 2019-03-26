library(vimp)


### Name: cv_vim_nodonsker
### Title: Nonparametric Variable Importance Estimates using
###   Cross-validation, without Donsker class relaxation
### Aliases: cv_vim_nodonsker

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
est <- cv_vim_nodonsker(Y = y, X = x, indx = 2, V = 5, 
type = "regression", run_regression = TRUE, 
SL.library = learners, alpha = 0.05)

## ------------------------------------------
## doing things by hand, and plugging them in
## ------------------------------------------
## set up the folds
indx <- 2
V <- 5
set.seed(4747)
folds <- rep(seq_len(V), length = n)
folds <- sample(folds)
## get the fitted values by fitting the super learner on each pair
fhat_ful <- list()
fhat_red <- list()
for (v in 1:V) {
    ## fit super learner
    fit <- SuperLearner::SuperLearner(Y = y[folds != v, , drop = FALSE],
     X = x[folds != v, , drop = FALSE], SL.library = learners, cvControl = list(V = 5))
    fitted_v <- SuperLearner::predict.SuperLearner(fit)$pred
    ## get predictions on the validation fold
    fhat_ful[[v]] <- SuperLearner::predict.SuperLearner(fit, 
     newdata = x[folds == v, , drop = FALSE])$pred
    ## fit the super learner on the reduced covariates
    red <- SuperLearner::SuperLearner(Y = fitted_v,
     X = x[folds != v, -indx, drop = FALSE], SL.library = learners, cvControl = list(V = 5))
    ## get predictions on the validation fold
    fhat_red[[v]] <- SuperLearner::predict.SuperLearner(red, 
     newdata = x[folds == v, -indx, drop = FALSE])$pred
}
est <- cv_vim_nodonsker(Y = y, f1 = fhat_ful, f2 = fhat_red, indx = 2,
V = 5, folds = folds, type = "regression", run_regression = FALSE, alpha = 0.05)
## End(No test)




