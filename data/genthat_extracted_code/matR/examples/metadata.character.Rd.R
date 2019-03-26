library(matR)


### Name: metadata.character
### Title: Get metadata of projects and metagenomes
### Aliases: metadata metadata.character

### ** Examples

## Not run: 
##D ####  three levels of detail for project metadata
##D xx <- "mgp21 mgp24 mgp30"
##D metadata (xx)
##D metadata (xx, detail=TRUE)
##D names (metadata (xx, detail="verbose"))
##D 
##D ####  similar (but not identical) for metagenome metadata
##D yy <- "mgm4440066.3 mgm4440062.3 mgm4440055.3 mgm4441681.3 mgm4440463.3 mgm4440464.3"
##D metadata (yy)
##D metadata (yy, detail=TRUE)
##D names (metadata (yy, detail="metadata"))
## End(Not run)

####  relevant documentation for underlying API calls
doc.MGRAST (3, head=c('project','instance','parameters','options'))
doc.MGRAST (3, head=c('metagenome','instance','parameters','options'))



