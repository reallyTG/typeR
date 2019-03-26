library(ssym)


### Name: Ovocytes
### Title: Fraction of cell volume
### Aliases: Ovocytes

### ** Examples

data("Ovocytes", package="ssym")
xl <- "Time"
yl <- "Fraction of Cell Volume"
mm <- "Fraction of Cell Volume for Mature and Immature Goat Ovocytes"
rx <- range(Ovocytes$time)
ry <- range(Ovocytes$fraction)
plot(Ovocytes$time[Ovocytes$type=='Mature'], Ovocytes$fraction[Ovocytes$type=='Mature'],
     xlim=rx, ylim=ry, type="p", cex=0.5, lwd=1, ylab="", xlab="")
par(new=TRUE)
plot(Ovocytes$time[Ovocytes$type=='Immature'], Ovocytes$fraction[Ovocytes$type=='Immature'],
     xlim=rx, ylim=ry, type="p", cex=0.5, lwd=2, ylab=yl, xlab=xl, main=mm)
legend(rx[1], ry[2], pt.lwd=c(1,2), bty="n", legend=c("Mature","Immature"), pt.cex=0.5, pch=1)



