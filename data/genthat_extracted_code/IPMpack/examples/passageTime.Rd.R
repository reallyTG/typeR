library(IPMpack)


### Name: passageTime
### Title: Defines passage time to a chosen continuous stage.
### Aliases: passageTime

### ** Examples

# With a single continuous state variable (e.g. size)
dff <- generateData()
Pmatrix <- makeIPMPmatrix(minSize = min(dff$size, na.rm = TRUE), 
maxSize = max(dff$size, na.rm = TRUE), growObj = makeGrowthObj(dff), 
survObj = makeSurvObj(dff), correction="constant")
targetSize <- 8
passage <- passageTime(targetSize, Pmatrix)

plot(Pmatrix@meshpoints, passage, ylab = "Passage time", 
 xlab = "Continuous (e.g. size) stage", 
	type = "l", col = "dark gray", ylim = c(0, max(passage)), 
	xlim=c(Pmatrix@meshpoints[1],targetSize+1))
abline(v = targetSize, col="red")




