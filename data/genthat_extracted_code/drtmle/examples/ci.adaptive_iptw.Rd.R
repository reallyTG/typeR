library(drtmle)


### Name: ci.adaptive_iptw
### Title: Confidence intervals for adaptive_iptw objects
### Aliases: ci.adaptive_iptw

### ** Examples

# load super learner
library(SuperLearner)
# fit adaptive_iptw
set.seed(123456)
n <- 200
W <- data.frame(W1 = runif(n), W2 = rnorm(n))
A <- rbinom(n,1,plogis(W$W1 - W$W2))
Y <- rbinom(n, 1, plogis(W$W1*W$W2*A))

fit1 <- adaptive_iptw(W = W, A = A, Y = Y, a_0 = c(1,0),
               SL_g=c("SL.glm","SL.mean","SL.step"),
               SL_Qr="SL.glm")

# get confidence intervals for each mean
ci_mean <- ci(fit1)

# get confidence intervals for ATE
ci_ATE <- ci(fit1, contrast = c(1,-1))

# get confidence intervals for risk ratio
# by inputting own contrast function
# this computes CI on log scale and back transforms
myContrast <- list(f = function(eff){ log(eff) },
                   f_inv = function(eff){ exp(eff) },
                   h = function(est){ est[1]/est[2] },
                   fh_grad =  function(est){ c(1/est[1],-1/est[2]) })
ci_RR <- ci(fit1, contrast = myContrast)



