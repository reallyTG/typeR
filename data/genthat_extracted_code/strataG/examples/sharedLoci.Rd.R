library(strataG)


### Name: sharedLoci
### Title: Shared Loci
### Aliases: sharedLoci propSharedLoci sharedAlleles .propSharedIds
### Keywords: internal

### ** Examples

data(msats.g)
msats.g <- stratify(msats.g, "fine")

sharedAlleles(msats.g)

## Not run: 
##D propSharedLoci(msats.g, num.cores = 2)
## End(Not run)




