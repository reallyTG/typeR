library(IPMpack)


### Name: makeIPMFmatrix
### Title: Builds F matrices.
### Aliases: makeIPMFmatrix createIPMFmatrix

### ** Examples

# Data with only continuous stage and one habitat
dff <- generateData()
dff$fec[dff$fec==0] <- NA
fv1 <- makeFecObj(dff, Formula = fec~size, Transform = "log")
Fmatrix <- makeIPMFmatrix(fecObj = fv1, nBigMatrix = 20, 
	minSize = min(dff$size, na.rm = TRUE), 
	maxSize = max(dff$size, na.rm = TRUE), correction="constant")

slotNames(Fmatrix)

image(Fmatrix@meshpoints, Fmatrix@meshpoints, t(Fmatrix), 
	xlab = "Continuous (e.g. size) stage at t", 
		ylab = "Continous (e.g. size) stage at t+1")



