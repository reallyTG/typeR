library(pCalibrate)


### Name: LRCalibrate
### Title: Calibration of two-sided P-values obtained from the likelihood
###   ratio test statistic
### Aliases: LRCalibrate
### Keywords: htest models & regression

### ** Examples

LRCalibrate(p=c(0.05, 0.01, 0.005), df=2, alternative="simple")
# gamma alternatives
LRCalibrate(p=c(0.05, 0.01, 0.005), df=c(2, 5, 10))

# plot the minimum Bayes factor as a function of the P-value
# for different degrees of freedom df of the LR test statistic
par(mfrow=c(1,2), las=1)

p <- exp(seq(log(0.005), log(0.3), by=0.01))
df <- c(1, 5, 20)
par(las=1)

# for a simple alternative
minBF.sim <- LRCalibrate(p, df=df, alternative="simple")
matplot(p, t(minBF.sim), type="l", ylab="Minimum Bayes factor", log="xy", 
        xlab="Two-sided LR-test P-value", lty=1, lwd=2, axes=FALSE,
        main="Simple alternative")
axis(1, at=c(0.01, 0.03, 0.1, 0.3), c(0.01, 0.03, 0.1, 0.3))
my.values <- c(30, 20, 10, 5, 3, 1)
my.at <- 1/my.values
my.ylegend <- c(paste("1/", my.values[-length(my.values)], sep=""), "1")
axis(2, at=my.at, my.ylegend)
box()
legend("bottomright", legend=c("df=1", "df=5", "df=20"), 
        lty=1, lwd=2, , col=1:3)

# for gamma alternatives
minBF.loc <- LRCalibrate(p, df=df, alternative="gamma")
matplot(p, t(minBF.loc), type="l", ylab="  Minimum Bayes factor", log="xy", 
        xlab="Two-sided LR-test P-value", lty=1, lwd=2, axes=FALSE,
        main="Local alternatives")
axis(1, at=c(0.01, 0.03, 0.1, 0.3), c(0.01, 0.03, 0.1, 0.3))
axis(2, at=my.at, my.ylegend)
box()
legend("bottomright", legend=c("df=1", "df=5", "df=20"), 
        lty=1, lwd=2, col=1:3)



