library(allanvar)


### Name: avar
### Title: Allan Variance (cluster size as a power of 2).
### Aliases: avar
### Keywords: ~kwd1 ~kwd2

### ** Examples

#Load data 
data(gyroz)

#Allan variance computation using avar
avgyroz <- avar(gyroz@.Data, frequency(gyroz))
plotav(avgyroz)
abline(1.0+log(avgyroz$time[1]), -1/2, col="green", lwd=4, lty=10)
abline(1.0+log(avgyroz$time[1]), 1/2, col="green", lwd=4, lty=10)
legend(0.11, 1e-03, c("Random Walk"))
legend(25, 1e-03, c("Rate Random Walk"))



