library(WRS2)


### Name: runmean
### Title: Running Interval Smoother
### Aliases: runmean rungen runmbo
### Keywords: models

### ** Examples

## trimmed mean smoother
fitmean <- runmean(Pygmalion$Pretest, Pygmalion$Posttest)
## MOM smoother
fitmest <- rungen(Pygmalion$Pretest, Pygmalion$Posttest)
## median smoother
fitmed <- rungen(Pygmalion$Pretest, Pygmalion$Posttest, est = "median")
## bagged onestep smoother
fitbag <- runmbo(Pygmalion$Pretest, Pygmalion$Posttest, est = "onestep")

## plot smoothers
plot(Pygmalion$Pretest, Pygmalion$Posttest, col = "gray", xlab = "Pretest", ylab = "Posttest",
     main = "Pygmalion Smoothing")
orderx <- order(Pygmalion$Pretest)
lines(Pygmalion$Pretest[orderx], fitmean[orderx], lwd = 2)
lines(Pygmalion$Pretest[orderx], fitmest[orderx], lwd = 2, col = 2)
lines(Pygmalion$Pretest[orderx], fitmed[orderx], lwd = 2, col = 3)
lines(Pygmalion$Pretest[orderx], fitbag[orderx], lwd = 2, col = 4)
legend("topleft", legend = c("Trimmed Mean", "MOM", "Median", "Bagged Onestep"), col = 1:4, lty = 1)



