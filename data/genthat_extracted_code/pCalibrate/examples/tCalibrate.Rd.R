library(pCalibrate)


### Name: tCalibrate
### Title: Calibration of P-values from t-tests
### Aliases: tCalibrate
### Keywords: htest models & regression

### ** Examples

tCalibrate(p=c(0.05, 0.01, 0.005), n=10, type="one.sided", alternative="simple")
# two-sided alternatives
tCalibrate(p=c(0.05, 0.01, 0.005), n=20, alternative="simple")
tCalibrate(p=c(0.05, 0.01, 0.005), n=c(10, 20, 50))

# for two-sided alternatives, plot the minimum Bayes factors 
# as a function of the P-value
par(mfrow=c(1,2), pty="s", las=1)

# plot for simple alternatives
p <- exp(seq(log(0.0001), log(0.3), by=0.01))
n <- c(10, 20, 50)
minBF <- tCalibrate(p, n, alternative = "simple")
# compare to the minimum Bayes factor for large n
bound1 <- zCalibrate(p, alternative="simple")
matplot(p, t(minBF), ylim=c(0.0003, 1), type="l", ylab="Min. Bayes factor", log="xy", 
        xlab="two-sided t-test P-value", lty=1, lwd=2, axes=FALSE, 
        main="Simple alternative")
lines(p, bound1, col="gray", lty=2, lwd=2)
my.at1 <- c(0.0001, 0.0003, 0.001, 0.003, 0.01, 0.03, 0.1, 0.3)
my.values1 <- as.character(c(format(c(0.0001,0.0003), nsmall=4, digits=4, scientific=FALSE), 
                    c(0.001, 0.003, 0.01, 0.03, 0.1, 0.3)))
axis(1, at=my.at1, labels=my.values1)
my.values2 <- c(3000, 1000, 300, 100, 30, 10, 3, 1)
my.at2 <- 1/my.values2
my.ylegend2 <- c(paste("1/", my.values2[-length(my.values2)], sep=""), "1")
axis(2, at=my.at2, labels=my.ylegend2)
box()
legend("bottomright", legend=rev(c("n=10", "n=20", "n=50", "n large")), 
        lty=rev(c(rep(1,3), 2)), lwd=2, col=rev(c(1:3, "gray")))
       
# plot for local normal alternatives
p <- exp(seq(log(0.0001), log(0.3), by=0.01))
n <- c(10, 20, 50)
minBF <- tCalibrate(p, n)
bound2 <- zCalibrate(p)
matplot(p, t(minBF), ylim=c(0.0003, 1), type="l", ylab="Min. Bayes factor", log="xy", 
        xlab="two-sided t-test P-value", lty=1, lwd=2, axes=FALSE, 
        main="Local normal alternatives")
lines(p, bound2, col="gray", lty=2, lwd=2)
axis(1, at=my.at1, labels=my.values1)
axis(2, at=my.at2, my.ylegend2)
box()            
legend("bottomright", legend=rev(c("n=10", "n=20", "n=50", "n large")), 
        lty=rev(c(rep(1,3), 2)), lwd=2, col=rev(c(1:3, "gray")))





