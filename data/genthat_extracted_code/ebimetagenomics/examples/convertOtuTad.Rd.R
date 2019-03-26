library(ebimetagenomics)


### Name: convertOtuTad
### Title: Converts an OTU count data frame to a TAD data frame
### Aliases: convertOtuTad
### Keywords: EMG

### ** Examples

## No test: 
ps=getProjectSummary("SRP047083")
samp=projectSamples(ps)
runs=runsBySample(ps,samp[2])
otu=getRunOtu(runs[1])
tad=convertOtuTad(otu)
head(tad)
## End(No test)


