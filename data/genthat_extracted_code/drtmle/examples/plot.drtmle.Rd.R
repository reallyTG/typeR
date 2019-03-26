library(drtmle)


### Name: plot.drtmle
### Title: Plot reduced dimension regression fits
### Aliases: plot.drtmle

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
               SL_Q=c("SL.glm","SL.mean","SL.glm.interaction"),
               SL_g=c("SL.glm","SL.mean","SL.glm.interaction"),
               SL_Qr="SL.npreg", SL_gr="SL.npreg",
               maxIter = 1, returnModels = TRUE)
# plot the reduced-dimension regression fits (not run)
## Not run: plot(fit1)



