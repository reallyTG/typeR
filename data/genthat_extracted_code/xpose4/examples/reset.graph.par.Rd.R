library(xpose4)


### Name: reset.graph.par
### Title: Resets Xpose variable definitions to factory settings
### Aliases: reset.graph.par
### Keywords: methods

### ** Examples


## Not run: 
##D ## xpdb5 is an Xpose data object
##D ## We expect to find the required NONMEM run and table files for run
##D ## 5 in the current working directory
##D xpdb5 <- xpose.data(5)
##D 
##D ## Import graphics preferences you saved earlier using export.graph.par
##D xpdb5 <- import.graph.par(xpdb5)
##D 
##D ## Reset to default values
##D xpdb5 <- reset.graph.par(xpdb5)
##D 
##D ## Change WRES definition
##D xpdb5 <- change.wres(xpdb5)
## End(Not run)




