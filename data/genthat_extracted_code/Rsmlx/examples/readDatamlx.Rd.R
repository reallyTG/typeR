library(Rsmlx)


### Name: readDatamlx
### Title: Read formatted data file
### Aliases: readDatamlx

### ** Examples

## Not run: 
##D # using a data file:
##D warfarinPK <- list(dataFile = "data/warfarinPK.csv",
##D                    headerTypes = c("id", "time", "observation", "amount", 
##D                                    "contcov", "contcov", "catcov"),
##D                    administration = "oral")
##D d <- readDatamlx(data=warfarinPK)
##D names(d)
##D head(d$treatment)
##D head(d$covariate)
##D head(d$y)
##D 
##D # using a Monolix project:
##D d <- readDatamlx(project='projects/warfarinPK.mlxtran')
##D 
## End(Not run)



