library(pearson7)


### Name: qpearson7
### Title: Evaluate the quantile function for the Pearson VII distribution
###   with shape parameter 3/2.
### Aliases: qpearson7

### ** Examples


curve(qpearson7(x), 0, 1, lwd = 2, ylab = expression(F^{-1}*(x)))
curve(qnorm(x), lwd = 2, lty = 2, n = 500, add = TRUE)




