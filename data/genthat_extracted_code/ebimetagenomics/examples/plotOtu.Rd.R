library(ebimetagenomics)


### Name: plotOtu
### Title: Plots OTU count data
### Aliases: plotOtu
### Keywords: EMG

### ** Examples

## No test: 
ps=getProjectSummary("SRP047083")
samp=projectSamples(ps)
runs=runsBySample(ps,samp[2])
otu=getRunOtu(runs[1])
plotOtu(otu)
## End(No test)


