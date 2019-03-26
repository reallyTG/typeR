library(scaleboot)


### Name: interface
### Title: Interface to External Packages
### Aliases: interface.scaleboot read.mt read.ass read.cnt sbfit.pvclust
###   sbpvclust
### Keywords: file

### ** Examples


## Not run: 
##D ## reading CONSEL files
##D ## sample files are found in mam15 subdirectory
##D ## see help(mam15) for details
##D mam15.mt <- read.mt("mam15.mt")
##D mam15.ass <- read.mt("mam15.ass")
##D mam15.cnt <- read.mt("mam15.cnt")
## End(Not run)

## replace au/bp entries in pvclust object
## see help(lung73) for details
library(pvclust)
data(lung73)
plot(lung73.pvclust) # draw dendrogram of pvlcust object
pvrect(lung73.pvclust)
lung73.new <- sbpvclust(lung73.pvclust,lung73.sb) # au <- k.3
plot(lung73.new) # redraw dendrogram with the new au/bp values
pvrect(lung73.new)



