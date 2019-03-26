library(VGAMextra)


### Name: toppleMeanlink
### Title: Link functions for the mean of 1-parameter continuous
###   distribution: The Topp-Leone distribution.
### Aliases: toppleMeanlink

### ** Examples

 ## E1. The toppleMeanlink() and its inverse ##
    theta <- ppoints(10)
    eta   <- toppleMeanlink(toppleMeanlink(theta = theta), inverse  =TRUE)
    summary(eta - theta)     # Zero


  ## E2. Some probability link functions ##
  ## No test: 
my.probs <- ppoints(100)

par(lwd = 2)
plot(my.probs, logit(my.probs), xlim = c(-0.1, 1.1), ylim = c(-5, 8),
     type = "l", col = "limegreen", 
     ylab = "transformation", las = 1, main = "Some probability link functions")
lines(my.probs, geometricffMeanlink(my.probs), col = "gray50")
lines(my.probs, logffMeanlink(my.probs), col = "blue")
lines(my.probs, probit(my.probs), col = "purple")
lines(my.probs, cloglog(my.probs), col = "chocolate")
lines(my.probs, cauchit(my.probs), col = "tan")
lines(my.probs, toppleMeanlink(my.probs), col = "black")
abline(v = c(0.5, 1), lty = "dashed")
abline(v = 0, h = 0, lty = "dashed")
legend(0.1, 8, 
      c( "toppleMeanlink", "geometricffMeanlink", "logffMeanlink", "logit", "probit", 
      "cloglog", "cauchit"), 
      col = c("black", "gray50", "blue", "limegreen", "purple", "chocolate", "tan"),
      lwd = 1, cex = 0.5)
par(lwd = 1) 
 
## End(No test)




