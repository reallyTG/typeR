library(drtmle)


### Name: ci.drtmle
### Title: Confidence intervals for drtmle objects
### Aliases: ci.drtmle

### ** Examples

# load super learner
library(SuperLearner)
# simulate data
set.seed(123456)
n <- 100
W <- data.frame(W1 = runif(n), W2 = rnorm(n))
A <- rbinom(n,1,plogis(W$W1 - W$W2))
Y <- rbinom(n, 1, plogis(W$W1*W$W2*A))
# fit drtmle with maxIter = 1 to run fast
fit1 <- drtmle(W = W, A = A, Y = Y, a_0 = c(1,0),
            family=binomial(),
            stratify=FALSE,
            SL_Q=c("SL.glm","SL.mean"),
            SL_g=c("SL.glm","SL.mean"),
            SL_Qr="SL.npreg",
            SL_gr="SL.npreg", maxIter = 1)

# get confidence intervals for each mean
ci_mean <- ci(fit1)

# get confidence intervals for ATE
ci_ATE <- ci(fit1, contrast = c(1,-1))

# get confidence intervals for risk ratio by
# computing CI on log scale and back-transforming
myContrast <- list(f = function(eff){ log(eff) },
                   f_inv = function(eff){ exp(eff) },
                   h = function(est){ est[1]/est[2] },
                   fh_grad =  function(est){ c(1/est[1],-1/est[2]) })
ci_RR <- ci(fit1, contrast = myContrast)



