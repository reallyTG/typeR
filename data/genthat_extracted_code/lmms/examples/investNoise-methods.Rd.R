library(lmms)


### Name: investNoise
### Title: Quality control for time course profiles
### Aliases: investNoise

### ** Examples

## Not run: 
##D data(kidneySimTimeGroup)
##D G1 <- kidneySimTimeGroup$group=="G1"
##D noiseTest <-investNoise(data=kidneySimTimeGroup$data[G1,],time=kidneySimTimeGroup$time[G1],
##D             sampleID=kidneySimTimeGroup$sampleID[G1])
##D summary(noiseTest)
##D plot(noiseTest,colorBy="propMissing")
## End(Not run)



