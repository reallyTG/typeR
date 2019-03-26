library(vimp)


### Name: merge_vim
### Title: Merge multiple 'vim' objects into one
### Aliases: merge_vim

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

## using Super Learner
est_2 <- vimp_regression(Y = y, X = x, indx = 2, 
           run_regression = TRUE, alpha = 0.05,
           SL.library = learners, cvControl = list(V = 10))

est_1 <- vimp_regression(Y = y, X = x, indx = 1, 
           run_regression = TRUE, alpha = 0.05, 
           SL.library = learners, cvControl = list(V = 10))

ests <- merge_vim(est_1, est_2)



