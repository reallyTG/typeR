library(gdm)


### Name: removeSitesFromSitePair
### Title: Remove Random Sites from Site-Pair Table
### Aliases: removeSitesFromSitePair
### Keywords: gdm

### ** Examples

##fit table environmental data
##sets up site-pair table, environmental tabular data
load(system.file("./data/gdm.RData", package="gdm"))
sppData <- gdmExpData[c(1,2,13,14)]
envTab <- gdmExpData[c(2:ncol(gdmExpData))]
sitePairTab <- formatsitepair(sppData, 2, XColumn="Long", YColumn="Lat", sppColumn="species", 
	siteColumn="site", predData=envTab)

removeSitesFromSitePair(sitePairTab, sampleSites=0.7)



