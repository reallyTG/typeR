library(ebimetagenomics)


### Name: runsBySample
### Title: Find runs associated with a particular sample ID within an EMG
###   project
### Aliases: runsBySample
### Keywords: EMG

### ** Examples

## No test: 
ps=getProjectSummary("SRP047083")
samp=projectSamples(ps)
runsBySample(ps,samp[2])
## End(No test)


