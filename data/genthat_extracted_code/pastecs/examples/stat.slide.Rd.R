library(pastecs)


### Name: stat.slide
### Title: Sliding statistics
### Aliases: stat.slide lines.stat.slide plot.stat.slide print.stat.slide
### Keywords: ts

### ** Examples

data(marbio)
# Sliding statistics with fixed-length blocs
statsl <- stat.slide(1:68, marbio[, "ClausocalanusA"], xmin=0, n=7, deltat=10)
statsl
plot(statsl, stat="mean", leg=TRUE, lpos=c(55, 2500), xlab="Station",
        ylab="ClausocalanusA")

# More information on the series, with predefined blocs
statsl2 <- stat.slide(1:68, marbio[, "ClausocalanusA"],
        xcut=c(0, 17, 25, 30, 41, 46, 70), basic=TRUE, desc=TRUE, norm=TRUE,
        pen=TRUE, p=0.95)
statsl2
plot(statsl2, stat="median", xlab="Stations", ylab="Counts",
        main="Clausocalanus A")              # Median
lines(statsl2, stat="min")                   # Minimum
lines(statsl2, stat="max")                   # Maximum
lines(c(17, 17), c(-50, 2600), col=4, lty=2) # Cuts
lines(c(25, 25), c(-50, 2600), col=4, lty=2)
lines(c(30, 30), c(-50, 2600), col=4, lty=2)
lines(c(41, 41), c(-50, 2600), col=4, lty=2)
lines(c(46, 46), c(-50, 2600), col=4, lty=2)
text(c(8.5, 21, 27.5, 35, 43.5, 57), 2300, labels=c("Peripheral Zone", "D1",
        "C", "Front", "D2", "Central Zone")) # Labels
legend(0, 1900, c("series", "median", "range"), col=1:3, lty=1)
# Get cuts back from the object
statsl2$xcut



