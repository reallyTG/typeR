library(IPMpack)


### Name: sizeToAge
### Title: Estimates size/stage to age relationships
### Aliases: sizeToAge

### ** Examples

dff <- generateData()
Pmatrix <- makeIPMPmatrix(minSize = min(dff$size, na.rm = TRUE),
maxSize = max(dff$size, na.rm = TRUE), growObj = makeGrowthObj(dff),
survObj = makeSurvObj(dff))
targetSize <- 8
startingSize <- 0
sizeToAge(Pmatrix, startingSize, targetSize)



