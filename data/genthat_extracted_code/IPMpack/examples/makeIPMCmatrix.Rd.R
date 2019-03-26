library(IPMpack)


### Name: makeIPMCmatrix
### Title: Builds C matrices.
### Aliases: makeIPMCmatrix createIPMCmatrix

### ** Examples

# Data with only continuous stage and one habitat
dff <- generateData()
dff$fec[dff$fec==0] <- NA
cv1 <- makeClonalObj(dff, Formula = fec~size, Transform = "log")
Cmatrix <- makeIPMCmatrix(clonalObj = cv1, nBigMatrix = 20, 
	minSize = min(dff$size, na.rm = TRUE), maxSize = max(dff$size, na.rm = TRUE))

image(Cmatrix@meshpoints, Cmatrix@meshpoints, t(Cmatrix), 
	xlab = "Continuous (e.g. size) stage at t", 
		ylab = "Continous (e.g. size) stage at t+1")



