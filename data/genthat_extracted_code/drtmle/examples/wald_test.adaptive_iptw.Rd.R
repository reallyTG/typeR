library(drtmle)


### Name: wald_test.adaptive_iptw
### Title: Wald tests for adaptive_iptw objects
### Aliases: wald_test.adaptive_iptw

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

# get test that each mean = 0.5
test_mean <- wald_test(fit1, null = 0.5)

# get test that the ATE = 0
ci_ATE <- ci(fit1, contrast = c(1,-1), null = 0)

# get test for risk ratio = 1 on log scale
myContrast <- list(f = function(eff){ log(eff) },
                   f_inv = function(eff){ exp(eff) }, # not necessary
                   h = function(est){ est[1]/est[2] },
                   fh_grad =  function(est){ c(1/est[1],-1/est[2]) })
ci_RR <- ci(fit1, contrast = myContrast, null = 1)



