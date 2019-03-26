library(IPMpack)


### Name: diagnosticsPmatrix
### Title: Creates a series of diagnostic graphs for a P matrix.
### Aliases: diagnosticsPmatrix

### ** Examples

# Example where mesh size does not have a major effect on model output:
dff <- generateData()
Pmatrix <- makeIPMPmatrix(minSize = min(dff$size, na.rm = TRUE),
	maxSize = max(dff$size, na.rm = TRUE), growObj = makeGrowthObj(dff), 
	survObj = makeSurvObj(dff))
diagnosticsPmatrix(Pmatrix, growObj = makeGrowthObj(dff), 
	survObj = makeSurvObj(dff), dff = dff)

# Compare with the following example where mesh size has an important 
# effect on output:
Pmatrix <- makeIPMPmatrix(nBigMatrix = 8, 
    minSize = min(dff$size, na.rm = TRUE), 
	maxSize = 0.5*max(dff$size, na.rm = TRUE), 
	   growObj = makeGrowthObj(dff), 
		survObj = makeSurvObj(dff))
diagnosticsPmatrix(Pmatrix, growObj = makeGrowthObj(dff), 
	survObj = makeSurvObj(dff), dff = dff)

#with cumul
Pmatrix <- makeIPMPmatrix(nBigMatrix = 10, 
    minSize = min(dff$size, na.rm = TRUE), 
	maxSize = max(dff$size, na.rm = TRUE), growObj = makeGrowthObj(dff), 
	survObj = makeSurvObj(dff), 
	integrateType = "cumul")
diagnosticsPmatrix(Pmatrix, growObj = makeGrowthObj(dff), 
	survObj = makeSurvObj(dff), dff = dff, integrateType = "cumul")


#with log increment
Pmatrix <- makeIPMPmatrix(nBigMatrix = 50, 
    minSize = min(dff$size, na.rm = TRUE), 
	maxSize = max(dff$size, na.rm = TRUE), 
	   growObj = makeGrowthObj(dff,Formula = logincr~size), 
		survObj = makeSurvObj(dff))
diagnosticsPmatrix(Pmatrix, 
    growObj = makeGrowthObj(dff,Formula = logincr~size), 
	survObj = makeSurvObj(dff), dff = dff)

#example with correction="discretizeExtremes"
Pmatrix <- makeIPMPmatrix(minSize = min(dff$size, na.rm = TRUE),
	maxSize = max(dff$size, na.rm = TRUE), growObj = makeGrowthObj(dff), 
	survObj = makeSurvObj(dff), correction="discretizeExtremes")
diagnosticsPmatrix(Pmatrix, growObj = makeGrowthObj(dff), 
	survObj = makeSurvObj(dff), dff = dff, correction="discretizeExtremes")





