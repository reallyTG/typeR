library(drtmle)


### Name: drtmle
### Title: TMLE estimate of the average treatment effect with doubly-robust
###   inference
### Aliases: drtmle

### ** Examples

# load super learner
library(SuperLearner)
# simulate data
set.seed(123456)
n <- 100
W <- data.frame(W1 = runif(n), W2 = rnorm(n))
A <- rbinom(n,1,plogis(W$W1 - W$W2))
Y <- rbinom(n, 1, plogis(W$W1*W$W2*A))
# A quick example of drtmle:
# We note that more flexible super learner libraries
# are available, and that we recommend the user use more flexible
# libraries for SL_Qr and SL_gr for general use.
fit1 <- drtmle(W = W, A = A, Y = Y, a_0 = c(1,0),
               family=binomial(),
               stratify=FALSE,
               SL_Q = c("SL.glm", "SL.mean", "SL.glm.interaction"),
               SL_g = c("SL.glm", "SL.mean", "SL.glm.interaction"),
               SL_Qr = "SL.glm",
               SL_gr = "SL.glm", maxIter = 1)



