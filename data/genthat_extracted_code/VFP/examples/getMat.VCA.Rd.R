library(VFP)


### Name: getMat.VCA
### Title: Transform list of VCA-object into VFP-matrix required for
###   fitting.
### Aliases: getMat.VCA

### ** Examples

## No test: 
library(VCA)
data(VCAdata1)
lst <- anovaVCA(y~(device+lot)/day/run, VCAdata1, by="sample")
mat <- getMat.VCA(lst)
mat
## End(No test)



