library(allanvar)


### Name: avarn
### Title: Allan Variance (incremental cluster size by unit).
### Aliases: avarn
### Keywords: ~kwd1 ~kwd2

### ** Examples

#Load data 
data(gyroz)

#Allan variance computation using avarn
avngyroz <- avarn(gyroz@.Data, frequency(gyroz))
plotav(avngyroz)
abline(1.0+log(avngyroz$time[1]), -1/2, col="green", lwd=4, lty=10)
abline(1.0+log(avngyroz$time[1]), 1/2, col="green", lwd=4, lty=10)
legend(0.11, 1e-03, c("Random Walk"))
legend(25, 1e-03, c("Rate Random Walk"))




