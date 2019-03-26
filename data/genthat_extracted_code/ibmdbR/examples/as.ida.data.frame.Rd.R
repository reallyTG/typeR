library(ibmdbR)


### Name: as.ida.data.frame
### Title: Convert an R object to an IDA data frame
### Aliases: as.ida.data.frame

### ** Examples

## Not run: 
##D 
##D #Add an ID column to iris
##D iris2 <- iris
##D iris2$ID <- 1:150
##D 
##D #Upload it and overwrite if already exists
##D idf <- as.ida.data.frame(iris2,"IRIS",clear.existing=T)
##D 	
## End(Not run)



