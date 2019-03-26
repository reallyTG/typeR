library(IPMpack)


### Name: makeIPMmatrix
### Title: Builds IPM matrices.
### Aliases: makeIPMmatrix

### ** Examples

dff <- generateData()
Pmatrix <- makeIPMPmatrix(
						growObj = makeGrowthObj(dff), 
						survObj = makeSurvObj(dff),
						nBigMatrix=20,
						minSize = min(dff$size, na.rm = TRUE), 
						maxSize=max(dff$size, na.rm=TRUE))	
dff$fec[dff$fec==0] <- NA
fv1 <- makeFecObj(dff, Formula = fec~size, Transform = "log")
Fmatrix <- makeIPMFmatrix(
						fecObj = fv1, 
						nBigMatrix = 20, 
						minSize = min(dff$size, na.rm = TRUE), 
						maxSize = max(dff$size, na.rm = TRUE))
IPMmatrix <- makeIPMmatrix(Pmatrix,Fmatrix)
slotNames(IPMmatrix)

require(fields)
par(mfrow=c(2,2))
image.plot(IPMmatrix@meshpoints, IPMmatrix@meshpoints, t(Pmatrix), 
	xlab = "Size(t)", 
	ylab = "Size(t+1)",
	main = "Survival/Growth Kernel")
image.plot(IPMmatrix@meshpoints, IPMmatrix@meshpoints, t(Fmatrix), 
	xlab = "Size (t)", 
	ylab = "Size(t+1)",
	main = "Fecundity Kernel")
image.plot(IPMmatrix@meshpoints, IPMmatrix@meshpoints, t(IPMmatrix), 
	xlab = "Size(t)", 
	ylab = "Size(t+1)",
	main = "IPM Kernel")
# trick to visualize the whole IPM kernel when the Fmatrix has values>>Pmatrix
image.plot(IPMmatrix@meshpoints, IPMmatrix@meshpoints, t(IPMmatrix)^.1, 
	xlab = "Size(t)", 
	ylab = "Size(t+1)",
	main = "IPM Kernel^(.01)")




