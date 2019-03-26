library(rsnps)


### Name: phenotypes
### Title: Get openSNP phenotype data for one or multiple users.
### Aliases: phenotypes

### ** Examples

## Not run: 
##D phenotypes(userid=1)
##D phenotypes(userid='1,6,8', df=TRUE)
##D phenotypes(userid='1-8', df=TRUE)
##D 
##D # coerce to data.frame
##D library(plyr)
##D df <- ldply(phenotypes(userid='1-8', df=TRUE))
##D head(df); tail(df)
##D 
##D # pass on curl options
##D phenotypes(1, verbose = TRUE)
## End(Not run)



