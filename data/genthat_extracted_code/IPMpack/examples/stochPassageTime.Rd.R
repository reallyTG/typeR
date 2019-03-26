library(IPMpack)


### Name: stochPassageTime
### Title: Estimates passage time in a discretely varying environment.
### Aliases: stochPassageTime

### ** Examples

dff <- generateData()
Pmatrix <- makeCompoundPmatrix(minSize = min(dff$size, na.rm = TRUE),
maxSize=max(dff$size, na.rm = TRUE), 
growObj = makeGrowthObj(dff, Formula=sizeNext~size+covariate), 
survObj = makeSurvObj(dff, Formula = surv~size+covariate), 
envMatrix = makeEnvObj(dff), correction="constant")
targetSize <- 8

passage <- stochPassageTime(targetSize, Pmatrix, makeEnvObj(dff))

plot(Pmatrix@meshpoints,passage[1:length(Pmatrix@meshpoints)], 
	ylab = "Passage time", xlab = "Continuous (e.g. size) stage", 
	type = "l", col = "dark gray", 
	xlim=c(Pmatrix@meshpoints[1],targetSize),
	ylim = c(0, max(passage)))
abline(v = targetSize, col = "red")
points(Pmatrix@meshpoints,
	passage[(length(Pmatrix@meshpoints)+1):(2*length(Pmatrix@meshpoints))], 
		type="l",col="green")



