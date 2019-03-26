library(vimp)


### Name: vimp_regression
### Title: Nonparametric Variable Importance Estimates
### Aliases: vimp_regression

### ** Examples

library(SuperLearner)
library(gam)
## generate the data
## generate X
p <- 2
n <- 100
x <- data.frame(replicate(p, stats::runif(n, -5, 5)))

## apply the function to the x's
smooth <- (x[,1]/5)^2*(x[,1]+7)/5 + (x[,2]/3)^2

## generate Y ~ Normal (smooth, 1)
y <- smooth + stats::rnorm(n, 0, 1)

## set up a library for SuperLearner
learners <- "SL.gam"

## using Y and X
est <- vimp_regression(y, x, indx = 2, 
           alpha = 0.05, run_regression = TRUE, 
           SL.library = learners, cvControl = list(V = 10))

## using pre-computed fitted values
full <- SuperLearner(Y = y, X = x,
SL.library = learners, cvControl = list(V = 10))
full.fit <- predict(full)$pred
reduced <- SuperLearner(Y = full.fit, X = x[, 2, drop = FALSE],
SL.library = learners, cvControl = list(V = 10))
red.fit <- predict(reduced)$pred

est <- vimp_regression(Y = y, f1 = full.fit, f2 = red.fit, 
            indx = 2, run_regression = FALSE, alpha = 0.05)




