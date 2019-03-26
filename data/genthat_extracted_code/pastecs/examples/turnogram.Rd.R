library(pastecs)


### Name: turnogram
### Title: Calculate and plot a turnogram for a regular time series
### Aliases: turnogram extract.turnogram identify.turnogram plot.turnogram
###   print.summary.turnogram print.turnogram summary.turnogram
### Keywords: ts htest

### ** Examples

data(bnr)
# Let's transform series 4 into a time series (supposing it is regular)
bnr4 <- as.ts(bnr[, 4])
plot(bnr4, type="l", main="bnr4: raw data", xlab="Time")
# A simple turnogram is calculated
bnr4.turno <- turnogram(bnr4)
summary(bnr4.turno)
# A complete turnogram confirms that "level=3" is a good value: 
turnogram(bnr4, complete=TRUE)
# Data with maximum info. are extracted (thus taking 1 every 3 observations)
bnr4.interv3 <- extract(bnr4.turno)
plot(bnr4, type="l", lty=2, xlab="Time")
lines(bnr4.interv3, col=2)
title("Original bnr4 (dotted) versus max. info. curve (plain)")
# Choose another level (for instance, 6) and extract the corresponding series
bnr4.turno$level <- 6
bnr4.interv6 <- extract(bnr4.turno)
# plot both extracted series on top of the original one
plot(bnr4, type="l", lty=2, xlab="Time")
lines(bnr4.interv3, col=2)
lines(bnr4.interv6, col=3)
legend(70, 580, c("original", "interval=3", "interval=6"), col=1:3, lty=c(2, 1, 1))
# It is hard to tell on the graph which series contains more information
# The turnogram shows us that it is the "interval=3" one!



