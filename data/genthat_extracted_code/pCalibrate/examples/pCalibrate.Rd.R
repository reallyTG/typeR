library(pCalibrate)


### Name: pCalibrate
### Title: Calibrations of two-sided P-values directly based on the P-value
### Aliases: pCalibrate

### ** Examples

pCalibrate(p=c(0.05, 0.01, 0.001))
pCalibrate(p=c(0.05, 0.01, 0.001), alternative="informative")

# plot the 2 calibrations as a function of the P-value
par(las=1)
p <- exp(seq(log(0.0001), log(0.3), by=0.01))
minBF1 <- pCalibrate(p=p)
minBF2 <- pCalibrate(p=p, alternative="informative")
plot(p, minBF1, type="l", log="xy",
      xlab="Two sided P-value", ylab="Minimum Bayes factor", 
     axes=FALSE, lwd=2, col=1)
lines(p, minBF2, col=2, lwd=2)
axis(1, at=c(0.0001, 0.0003, 0.001, 0.003, 0.01, 0.03, 0.1, 0.3), 
     as.character(c(format(c(0.0001,0.0003), nsmall=4, digits=4, scientific=FALSE), 
                    c(0.001, 0.003, 0.01, 0.03, 0.1, 0.3))))
my.values <- c(3000, 1000, 300, 100, 30, 10, 3, 1)
my.at <- 1/my.values
my.ylegend <- c(paste("1/", my.values[-length(my.values)], sep=""), "1")
axis(2, at=my.at, my.ylegend)
box()
legend("bottomright", lty=1, lwd=2, 
        legend=c("- e p log(p)", "- e q log(q)")
                , col=c(1,2))



