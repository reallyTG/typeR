library(allanvar)


### Name: avari
### Title: Allan Variance (from integrated values).
### Aliases: avari
### Keywords: ~kwd1 ~kwd2

### ** Examples

#Load data 
data(gyroz)

#Allan variance computation using avari
#Simple integration of the angular velocity
igyroz <- cumsum(gyroz@.Data * (1/frequency(gyroz)))
igyroz <- ts (igyroz, start=c(igyroz[1]), delta=(1/frequency(gyroz)))
avigyroz <- avari(igyroz@.Data, frequency(igyroz))
plotav(avigyroz)
abline(1.0+log(avigyroz$time[1]), -1/2, col="green", lwd=4, lty=10)
abline(1.0+log(avigyroz$time[1]), 1/2, col="green", lwd=4, lty=10)
legend(0.11, 1e-03, c("Random Walk"))
legend(25, 1e-03, c("Rate Random Walk"))




