library(pCalibrate)


### Name: zCalibrate
### Title: Calibration of P-values from z-tests
### Aliases: zCalibrate
### Keywords: htest

### ** Examples
  
# two-sided alternatives
zCalibrate(p=c(0.05, 0.01, 0.005), alternative="simple")
zCalibrate(p=c(0.05, 0.01, 0.005))
zCalibrate(p=c(0.05, 0.01, 0.005), alternative="local")
# one-sided alternatives
zCalibrate(p=c(0.05, 0.01, 0.005), type="one.sided", alternative="simple")
zCalibrate(p=c(0.05, 0.01, 0.005), type="one.sided")
zCalibrate(p=c(0.05, 0.01, 0.005), type="one.sided", alternative="local")

# plot the different calibrations as a function of the P-value
par(las=1)
p <- exp(seq(log(0.0001), log(0.3), by=0.01))
minBF <- matrix(NA, ncol=4, nrow=length(p))
minBF[ ,1] <- zCalibrate(p)
minBF[ ,2] <- zCalibrate(p, type="two.sided", alternative="local")
minBF[ ,3] <- zCalibrate(p, type="two.sided", alternative="simple")
minBF[ ,4] <- zCalibrate(p, type="one.sided", alternative="simple")
matplot(p, minBF, type="l", ylab="Minimum Bayes factor", log="xy", 
        xlab="z-test P-value", lty=1, lwd=2, col=c(1,3,2,4), axes=FALSE)
axis(1, at=c(0.0001, 0.0003, 0.001, 0.003, 0.01, 0.03, 0.1, 0.3), 
     as.character(c(format(c(0.0001,0.0003), nsmall=4, digits=4, scientific=FALSE), 
                    c(0.001, 0.003, 0.01, 0.03, 0.1, 0.3))))
my.values <- c(3000, 1000, 300, 100, 30, 10, 3, 1)
my.at <- 1/my.values
my.ylegend <- c(paste("1/", my.values[-length(my.values)], sep=""), "1")
axis(2, at=my.at, my.ylegend)
box()
legend("bottomright", lty=1, lwd=2, 
        legend=c("normal", "unimodal symmetric", 
                "two-sided simple", "one-sided simple"), col=c(1,3,2,4))



