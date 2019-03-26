library(gdm)


### Name: gdm.varImp
### Title: Quantify model significance and variable importance/significance
###   in gdm using matrix permutation.
### Aliases: gdm.varImp
### Keywords: gdm

### ** Examples

##fit table environmental data
##sets up site-pair table, environmental tabular data
load(system.file("./data/gdm.RData", package="gdm"))
sppData <- gdmExpData[c(1,2,13,14)]
envTab <- gdmExpData[c(2:ncol(gdmExpData))]
sitePairTab <- formatsitepair(sppData, 2, XColumn="Long", YColumn="Lat", sppColumn="species", 
	siteColumn="site", predData=envTab)

## not run
#modTest <- gdm.varImp(sitePairTab, geo=T, nPerm=50, parallel=T, cores=10)
#barplot(sort(modTest[[2]][,1], decreasing=T))




