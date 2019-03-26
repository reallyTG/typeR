library(IgorR)


### Name: SummariseSweepFile
### Title: Extract summary information from an Nclamp/Igor Sweep File
### Aliases: SummariseSweepFile

### ** Examples

l <- SummariseSweepFile(system.file("igor", "WedJul407c2_001.pxp", package="IgorR"))
cat("There are", l$NumWaves, "waves in the file each of total duration", l$StimWaveLength, 
 "ms and sample duration", l$StimSampleInterval, "ms \n") 



