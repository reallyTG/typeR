library(xpose4)


### Name: change.xvardef
### Title: Change Xpose variable definitions.
### Aliases: change.xvardef change.xvardef<-
### Keywords: methods

### ** Examples


## Here we load the example xpose database 
xpdb <- simpraz.xpdb

# Change the "id" variable to point to "PRED" in the xpose object
xpdb <- change.xvardef(xpdb,var="id",def="PRED")

# Check the value of the "id" variable
xvardef("id",xpdb)

# Change the "idv" variable
change.xvardef(xpdb,var="idv") <- "TIME"

# Change the covariate scope
change.xvardef(xpdb,var="covariates") <- c("SEX","AGE","WT")

## Not run: 
##D # Use the interactive capabilities of the function
##D xpdb <- change.xvardef(xpdb)
## End(Not run)




