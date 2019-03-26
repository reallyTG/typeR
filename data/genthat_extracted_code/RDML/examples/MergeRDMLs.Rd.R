library(RDML)


### Name: MergeRDMLs
### Title: Merges 'RDML' objects
### Aliases: MergeRDMLs

### ** Examples

## Not run: 
##D PATH <- path.package("RDML")
##D filename <- paste(PATH, "/extdata/", "lc96_bACTXY.rdml", sep ="")
##D lc96 <- RDML$new(filename)
##D filename <- paste(PATH, "/extdata/", "stepone_std.rdml", sep ="")
##D stepone <- RDML$new(filename)
##D merged <- MergeRDMLs(list(lc96,stepone))
##D merged$AsDendrogram()
## End(Not run)



