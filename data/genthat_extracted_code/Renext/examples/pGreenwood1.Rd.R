library(Renext)


### Name: pGreenwood1
### Title: Probability that the Greenwood's statistic is smaller than one
### Aliases: pGreenwood1

### ** Examples

n <- 8:500
plot(n, pGreenwood1(n), type = "l", col = "orangered", lwd = 2,
     log ="x", ylim =c(0.5, 0.7), main = "slow convergence to 0.5")
grid() ; abline(h = 0.5, col = "SpringGreen")



