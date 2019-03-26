library(ebimetagenomics)


### Name: mergeOtu
### Title: Merges two OTU count data data frames to produce a combined OTU
###   count data data frame
### Aliases: mergeOtu
### Keywords: EMG

### ** Examples

## No test: 
ps=getProjectSummary("SRP047083")
samp=projectSamples(ps)
runs=runsBySample(ps,samp[2])

# merge two:
otu1=getRunOtu(runs[1])
otu2=getRunOtu(runs[2])
mergeOtu(otu1,otu2)

# merge many:
otuList=lapply(as.list(runs[1:5]),function(rid){getRunOtu(rid)})
Reduce(mergeOtu,otuList)
## End(No test)


