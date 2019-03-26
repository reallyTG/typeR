library(sdm)


### Name: as.data.frame
### Title: Get a data.frame with record id values (rID)
### Aliases: as.data.frame as.data.frame,sdmdata-method
### Keywords: spatial methods

### ** Examples

## Not run: 
##D file <- system.file("external/data.sdd", package="sdm")
##D 
##D d <- read.sdm(file)
##D 
##D d # a sdmdata object
##D 
##D df <- as.data.frame(d)
##D head(df)
##D 
##D # only the records with rID == c(1,2,3):
##D as.data.frame(d, ind=1:3)
## End(Not run)




