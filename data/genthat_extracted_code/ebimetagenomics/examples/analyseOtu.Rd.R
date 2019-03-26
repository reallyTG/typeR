library(ebimetagenomics)


### Name: analyseOtu
### Title: Analysis of OTU count data
### Aliases: analyseOtu
### Keywords: EMG

### ** Examples

## No test: 
ps=getProjectSummary("SRP047083")
samp=projectSamples(ps)
runs=runsBySample(ps,samp[2])
otu=getRunOtu(runs[1])
analyseOtu(otu,plot=FALSE)
## End(No test)


