library(robmed)


### Name: weights.cov_Huber
### Title: Robustness weights of Huber M-estimation of location and scatter
### Aliases: weights.cov_Huber
### Keywords: utilities

### ** Examples

data("BSG2014")

# define variables
x <- "ValueDiversity"
y <- "TeamCommitment"
m <- "TaskConflict"

# compute Huber M-estimator
S <- cov_Huber(BSG2014[, c(x, y, m)])
weights(S, type = "relative")




