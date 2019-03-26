library(rpubchem)


### Name: find.assay.id
### Title: Search for Assay ID's
### Aliases: find.assay.id
### Keywords: programming

### ** Examples

## Not run: 
##D ## find assay ID's related to yeast
##D aids <- find.assay.id('yeast')
##D 
##D ## get the description of the first 10 assays
##D descs <- lapply( lapply(as.list(aids[1:10]), get.assay.desc), function(x)
##D x$assay.desc )
## End(Not run)



