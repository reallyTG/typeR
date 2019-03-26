library(lmms)


### Name: summary.noise
### Title: Summary of a 'noise' Object
### Aliases: summary.noise

### ** Examples

## Not run: 
##D data(kidneySimTimeGroup)
##D # running for samples in group 1
##D G1 <- which(kidneySimTimeGroup$group=="G1")
##D noiseTest<- investNoise(data=kidneySimTimeGroup$data[G1,],
##D                   time=kidneySimTimeGroup$time[G1],
##D                   sampleID=kidneySimTimeGroup$sampleID[G1])
##D summary(noiseTest)
## End(Not run)



