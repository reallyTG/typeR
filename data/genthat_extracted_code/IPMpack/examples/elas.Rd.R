library(IPMpack)


### Name: elas
### Title: Estimates matrix element sensitivities and elasticities.
### Aliases: elas sens

### ** Examples

dff <- generateData()
Pmatrix <- makeIPMPmatrix(minSize = min(dff$size, na.rm=TRUE),
maxSize = max(dff$size, na.rm = TRUE), growObj = makeGrowthObj(dff),
survObj = makeSurvObj(dff))

Fmatrix <- makeIPMFmatrix(minSize = min(dff$size, na.rm = TRUE),
maxSize = max(dff$size, na.rm = TRUE), fecObj = makeFecObj(dff))

IPM <- Pmatrix + Fmatrix

par(mfrow = c(1, 2))

senst <- sens(IPM)
image(Pmatrix@meshpoints, Pmatrix@meshpoints,t(senst), 
	main = "Sensitivity", xlab = "Continuous (e.g. size) stage in t", 
		ylab = "Continuous (e.g. size) stage in t+1")

elast <- elas(IPM)
image(Pmatrix@meshpoints, Pmatrix@meshpoints, t(elast), main = "Elasticity", 
	xlab = "Continuous (e.g. size) stage in t", 
		ylab = "Continuous (e.g. size) stage in t+1")



