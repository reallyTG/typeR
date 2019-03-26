library(vimp)


### Name: average_vim
### Title: Average multiple independent importance estimates
### Aliases: average_vim

### ** Examples

library(SuperLearner)
library(gam)
## generate the data
p <- 2
n <- 100
x <- data.frame(replicate(p, stats::runif(n, -5, 5)))

## apply the function to the x's
smooth <- (x[,1]/5)^2*(x[,1]+7)/5 + (x[,2]/3)^2

## generate Y ~ Normal (smooth, 1)
y <- smooth + stats::rnorm(n, 0, 1)

## set up a library for SuperLearner
learners <- "SL.gam"

## get estimates on independent splits of the data
samp <- sample(1:n, n/2, replace = FALSE)

## using Super Learner
est_2 <- vimp_regression(Y = y[samp], X = x[samp, ], indx = 2, 
           run_regression = TRUE, alpha = 0.05,
           SL.library = learners, cvControl = list(V = 10))

est_1 <- vimp_regression(Y = y[-samp], X = x[-samp, ], indx = 2, 
           run_regression = TRUE, alpha = 0.05,
           SL.library = learners, cvControl = list(V = 10))

ests <- average_vim(est_1, est_2, weights = c(1/2, 1/2))



