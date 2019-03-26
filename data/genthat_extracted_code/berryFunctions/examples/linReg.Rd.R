library(berryFunctions)


### Name: linReg
### Title: linear regression with plotting
### Aliases: linReg
### Keywords: aplot hplot regression

### ** Examples


a <- 1:30
b <- a/2.345+rnorm(30,0,3)

linReg(a,b)
linReg(a,b, ylab="Hallo", pch=1, col=3, main="Regression by Berry")
linReg(a, b, pos1=15, pos2=0) # position of topleft corner of legend
linReg(a, b, pos1=NA, col="orange") # to suppress legend
linReg(a, b, plotrange=5:20) # only for plotting, all data points are used!

# Formula specification:
linReg(b~a)
linReg(Volume~Height, data=trees)

# For more flexibility with the datapoints, plot first, then use linReg with add=TRUE:
plot(a,b, xlim=c(-5,45))
linReg(a, b, pos1="bottomright", add=TRUE, inset=.1) # inset: distance from plot border
linReg(a, b, digits=c(7,4,3), add=TRUE, col=3, lty=2, lwd=4, level=0.8)
linReg(a, b, pos1="topleft", inset=c(-0.1, 0.3), legargs=list(xpd=TRUE), add=TRUE)




