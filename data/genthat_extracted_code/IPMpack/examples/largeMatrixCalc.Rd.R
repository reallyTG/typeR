library(IPMpack)


### Name: largeMatrixCalc
### Title: Calculates population growth rate (lambda) and stable stage
###   distribution in a computationally efficient way when the number of
###   bins in the IPM is large.
### Aliases: largeMatrixCalc

### ** Examples

dff <- generateData()
Pmatrix <- makeIPMPmatrix(minSize = min(dff$size, na.rm = TRUE), 
	maxSize = max(dff$size, na.rm = TRUE), growObj = makeGrowthObj(dff), 
	  survObj = makeSurvObj(dff))
Fmatrix <- makeIPMFmatrix(minSize = min(dff$size, na.rm = TRUE), 
	maxSize = max(dff$size, na.rm = TRUE),fecObj = makeFecObj(dff))

largeMatrixCalc(Pmatrix, Fmatrix)

par(mfrow=c(1,2),pty="s")

plot(largeMatrixCalc(Pmatrix, Fmatrix)$stableDist, 
    ylab = "Stable stage distribution", 
	xlab = "Continuous (e.g. size) stage", 
	type = "l", col = "blue", lty = 1, ylim = c(0:1))

#Note that this will not always run - as tolerance levels 
# for convergence are set to be quite high
#plot(largeMatrixCalc(Pmatrix, Fmatrix)$reprodValue, 
#    ylab = "Reproductive value", 
#	xlab = "Continuous (e.g. size) stage", type = "l", col = "red", 
#    lty = 1, ylim = c(0:1))




