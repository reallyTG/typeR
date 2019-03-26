library(perspectev)


### Name: perspectev.read
### Title: Convert occurrence data to perspectev input format
### Aliases: perspectev.read

### ** Examples

  data(testData)
  survivorship = data.frame(cbind(testData$Genus,testData$Species,runif(nrow(testData),0,1)))
  data = perspectev.read(testData,survProb=survivorship,
  upper="Genus",lower="Species",traits=c("Lat","Long"),traitfun=mcpRange,
  projection=FALSE)



