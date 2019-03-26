library(fda)


### Name: pinch
### Title: pinch force data
### Aliases: pinch pinchraw pinchtime
### Keywords: datasets

### ** Examples

matplot (pinchtime, pinchraw, type="l", lty=1, cex=2,
         col=1, lwd=1,  xlab = "Seconds", ylab="Force (N)")
abline(h=2, lty=2)

matplot (pinchtime, pinch, type="l", lty=1, cex=2,
         col=1, lwd=1,  xlab = "Seconds", ylab="Force (N)")
abline(h=2, v=0.075, lty=2)



