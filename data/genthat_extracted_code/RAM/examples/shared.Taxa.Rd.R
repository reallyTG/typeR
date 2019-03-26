library(RAM)


### Name: shared.Taxa
### Title: Summary of Shared Taxa Across ALL Subjects
### Aliases: shared.Taxa
### Keywords: math

### ** Examples

data(ITS1)
shared.Taxa(data=list(ITS1=ITS1))
## Not run: 
##D g1 <- tax.abund(ITS1, rank="g", drop.unclassified=TRUE)
##D shared.Taxa(data=list(genus_ITS1=g1), rank="g", is.OTU=FALSE)
## End(Not run)



