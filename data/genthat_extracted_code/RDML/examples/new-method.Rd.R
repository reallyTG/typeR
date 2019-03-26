library(RDML)


### Name: new
### Title: Creates new instance of 'RDML' class object
### Aliases: new RDML.new

### ** Examples

## Not run: 
##D ## Import from RDML file
##D PATH <- path.package("RDML")
##D filename <- paste(PATH, "/extdata/", "lc96_bACTXY.rdml", sep ="")
##D lc96 <- RDML$new(filename)
##D 
##D ## Some kind of overview for lc96
##D lc96$AsTable(name.pattern = sample[[react$sample$id]]$description)
##D lc96$AsDendrogram()
## End(Not run)



