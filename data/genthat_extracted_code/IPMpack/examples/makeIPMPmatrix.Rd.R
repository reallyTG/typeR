library(IPMpack)


### Name: makeIPMPmatrix
### Title: Builds P matrices.
### Aliases: makeIPMPmatrix createIPMPmatrix

### ** Examples

dff <- generateData()
Pmatrix <- makeIPMPmatrix(minSize = min(dff$size, na.rm = TRUE), 
	maxSize=max(dff$size, na.rm=TRUE), growObj = makeGrowthObj(dff), 
		survObj = makeSurvObj(dff))

image(Pmatrix@meshpoints, Pmatrix@meshpoints, t(Pmatrix), 
	xlab = "Continuous (e.g. size) stage at t", 
		ylab = "Continuous (e.g. size) stage at t+1")

Pmatrix <- makeIPMPmatrix(minSize = min(dff$size, na.rm = TRUE), 
	maxSize=max(dff$size, na.rm=TRUE), 
	   growObj = makeGrowthObj(dff,regType="changingVar"), 
		survObj = makeSurvObj(dff))

image(Pmatrix@meshpoints, Pmatrix@meshpoints, t(Pmatrix), 
	xlab = "Continuous (e.g. size) stage at t", 
		ylab = "Continuous (e.g. size) stage at t+1")

#example with discrete transition matrix
dff <- generateData(type="discrete")
Pmatrix <- makeIPMPmatrix(minSize = min(dff$size, na.rm = TRUE), 
	maxSize=max(dff$size, na.rm=TRUE), discreteTrans=makeDiscreteTrans(dff),
	growObj = makeGrowthObj(dff), 
		survObj = makeSurvObj(dff))

#discrete stages not plotted 
image(Pmatrix@meshpoints, Pmatrix@meshpoints, 
	t(log(Pmatrix[2:length(Pmatrix@meshpoints),2:length(Pmatrix@meshpoints)])), 
	xlab = "Continuous (e.g. size) stage at t", 
		ylab = "Continuous (e.g. size) stage at t+1")





