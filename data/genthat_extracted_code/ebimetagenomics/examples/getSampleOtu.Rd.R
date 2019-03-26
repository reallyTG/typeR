library(ebimetagenomics)


### Name: getSampleOtu
### Title: Downloads and merges all of the OTU count data associated with a
###   EMG sample
### Aliases: getSampleOtu
### Keywords: EMG

### ** Examples

## No test: 
ps=getProjectSummary("SRP108566")
samp=projectSamples(ps)
getSampleOtu(ps,samp[1])
## End(No test)


