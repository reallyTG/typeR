library(IPMpack)


### Name: varPassageTime
### Title: Estimates variation in passage time.
### Aliases: varPassageTime

### ** Examples

# With continuous (e.g. size) stage
dff <- generateData()
Pmatrix <- makeIPMPmatrix(minSize = min(dff$size, na.rm = TRUE),
maxSize <- max(dff$size, na.rm = TRUE), growObj = makeGrowthObj(dff), 
survObj = makeSurvObj(dff))
targetSize <- 8
vP <- varPassageTime(targetSize, Pmatrix)

plot(Pmatrix@meshpoints, vP, type = "l", xlab="Continuous (e.g. Size) stage", 
	xlim=c(Pmatrix@meshpoints[1],targetSize),
	ylab = "Variance in passage time", col = "dark gray")
abline(v = targetSize, col = "red")

## not sure variance works with this....





