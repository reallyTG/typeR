library(letsR)


### Name: lets.iucncont
### Title: Transform IUCN RedList conservation status to continuous values
### Aliases: lets.iucncont

### ** Examples

## Not run: 
##D #Vector transformation
##D status <- sample(c("EN","VU", "NT", "CR", "DD", "LC", "EX"), 
##D                  30, replace = TRUE) 
##D transV <- lets.iucncont(status)
##D 
##D #matrix transformation
##D data(IUCN)
##D transM <- lets.iucncont(IUCN)
##D 
## End(Not run)




