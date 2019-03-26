library(drtmle)


### Name: wald_test.drtmle
### Title: Wald tests for drtmle objects
### Aliases: wald_test.drtmle

### ** Examples

# load super learner
library(SuperLearner)
# simulate data
set.seed(123456)
n <- 100
W <- data.frame(W1 = runif(n), W2 = rnorm(n))
A <- rbinom(n,1,plogis(W$W1 - W$W2))
Y <- rbinom(n, 1, plogis(W$W1*W$W2*A))
# fit drtmle with maxIter = 1 so runs fast
fit1 <- drtmle(W = W, A = A, Y = Y, a_0 = c(1,0),
            family=binomial(),
            stratify=FALSE,
            SL_Q=c("SL.glm","SL.mean","SL.glm.interaction"),
            SL_g=c("SL.glm","SL.mean","SL.glm.interaction"),
            SL_Qr="SL.glm",
            SL_gr="SL.glm", maxIter = 1)
# get hypothesis test that each mean = 0.5
test_mean <- wald_test(fit1, null = 0.5)

# get test that ATE = 0
test_ATE <- wald_test(fit1, null = 0, contrast = c(1,-1))

# get test that risk ratio = 1, computing test on log scale
myContrast <- list(f = function(eff){ log(eff) },
                   f_inv = function(eff){ exp(eff) },
                   h = function(est){ est[1]/est[2] },
                   fh_grad =  function(est){ c(1/est[1],-1/est[2]) })
test_RR <- wald_test(fit1, contrast = myContrast, null = 1)



