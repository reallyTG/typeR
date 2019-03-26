library(drtmle)


### Name: adaptive_iptw
### Title: Compute asymptotically linear IPTW estimators with super
###   learning for the propensity score
### Aliases: adaptive_iptw

### ** Examples

# load super learner
library(SuperLearner)
# simulate data
set.seed(123456)
n <- 100
W <- data.frame(W1 = runif(n), W2 = rnorm(n))
A <- rbinom(n,1,plogis(W$W1 - W$W2))
Y <- rbinom(n, 1, plogis(W$W1*W$W2*A))
# fit iptw with maxIter = 1 to run fast
fit1 <- adaptive_iptw(W = W, A = A, Y = Y, a_0 = c(1,0),
               SL_g=c("SL.glm","SL.mean","SL.step"),
               SL_Qr="SL.npreg", maxIter = 1)



