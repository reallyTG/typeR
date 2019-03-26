library(pCalibrate)


### Name: FCalibrate
### Title: Calibration of two-sided P-values from the F-test in the linear
###   model
### Aliases: FCalibrate
### Keywords: htest models & regression

### ** Examples

FCalibrate(p=c(0.05, 0.01, 0.005), n=20, d=2, alternative="simple")
# chi-squared alternatives
FCalibrate(p=c(0.05, 0.01, 0.005), n=20, d=2, intercept=FALSE)
FCalibrate(p=c(0.05, 0.01, 0.005), n=20, d=c(2, 5, 10))
FCalibrate(p=c(0.05, 0.01, 0.005), n=c(10, 20, 50), d=2)

# plot for chi-squared alternatives: d=2 and different sample sizes n
# note that the minimum Bayes factor decreases with decreasing sample size
p <- exp(seq(log(0.0001), log(0.3), by=0.01))
n <- c(5, 10, 20)
minBF <- FCalibrate(p, n, d=2) 
# compare to the minimum Bayes factor for large n
minTBF <- LRCalibrate(p, df=2)
par(las=1)
matplot(p, t(minBF), ylim=c(0.0003, 1), type="l", ylab="Minimum Bayes factor", log="xy", 
        xlab="two-sided F-test P-value", lty=1, lwd=2, axes=FALSE, 
        main="Local normal alternatives, d=2")
lines(p, minTBF, col="gray", lty=2, lwd=2)
axis(1, at=c(0.0001, 0.0003, 0.001, 0.003, 0.01, 0.03, 0.1, 0.3), 
     as.character(c(format(c(0.0001,0.0003), nsmall=4, digits=4, scientific=FALSE), 
                    c(0.001, 0.003, 0.01, 0.03, 0.1, 0.3))))
my.values <- c(3000, 1000, 300, 100, 30, 10, 3, 1)
my.at <- 1/my.values
my.ylegend <- c(paste("1/", my.values[-length(my.values)], sep=""), "1")
axis(2, at=my.at, my.ylegend)
box()
legend("bottomright", 
       legend=rev(c("n=5", "n=10", "n=20", "n large")), 
       col=rev(c(1:3, "gray")), lty=c(2, rep(1, times=3)), lwd=2)



