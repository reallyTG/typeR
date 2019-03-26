library(ebimetagenomics)


### Name: getProjectSummary
### Title: Download an EMG project summary into a data frame
### Aliases: getProjectSummary
### Keywords: EMG

### ** Examples

## No test: 
ps = getProjectSummary("MGYS00000646")
# Tabulate number of runs by sample
table(ps$sample_id)
## End(No test)


