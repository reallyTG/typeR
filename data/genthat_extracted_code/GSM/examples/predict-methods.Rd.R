library(GSM)


### Name: predict-methods
### Title: Tail Probability Estimation for a Gamma Shape Mixture Model
### Aliases: predict-methods predict,ANY-method predict,gsm-method
### Keywords: methods

### ** Examples

set.seed(2040)
y <- rgsm(500, c(.1, .3, .4, .2), 1)
burnin <- 5
mcmcsim <- 10
J <- 250
gsm.out <- estim.gsm(y, J, 300, burnin + mcmcsim, 6500, 340, 1/J)
thresh <- c(0.1, 0.5, 0.75, 1, 2)
tail.prob.est <- tail.prob.true <- rep(NA, length(thresh))
for (i in 1:length(thresh)){
   tail.prob.est[i] <- mean(predict(gsm.out, thresh[i]))
   tail.prob.true[i] <- sum(y > thresh[i])/length(y)
}
qqplot(tail.prob.true, tail.prob.est, main = "Q-Q plot of true vs. estimated tail probability")
abline(0, 1, lty = 2)



