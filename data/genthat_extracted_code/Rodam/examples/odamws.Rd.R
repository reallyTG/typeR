library(Rodam)


### Name: odamws-class
### Title: API layer for the ODAM web services
### Aliases: odamws-class odamws

### ** Examples

## Not run: 
##D dh <- new("odamws", "https://pmb-bordeaux.fr/pmb/getdata/", "frim1")
##D dn <- show(dh)
##D # Get data from 'samples' subset with a constraint
##D data <- dh$getDataByName('samples','sample/365')
##D  # Get 'activome' data subset
##D ds <- dh$getSubsetByName('activome')
##D # Get the merged data of both data subsets based on their common identifier
##D refID <- "SampleID"
##D setName1 <- "activome"
##D setName2 <- "qNMR_metabo"
##D dsMerged <- dh$getMerged(refID, setName1, setName2)
## End(Not run)



