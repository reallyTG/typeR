library(ebimetagenomics)


### Name: getRunOtu
### Title: Downloads OTU count data associated with a EMG run
### Aliases: getRunOtu
### Keywords: EMG

### ** Examples

## No test: 
ps=getProjectSummary("SRP047083")
samp=projectSamples(ps)
runs=runsBySample(ps,samp[2])
getRunOtu(runs[1])
## End(No test)


