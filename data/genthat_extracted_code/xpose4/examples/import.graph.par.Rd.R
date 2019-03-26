library(xpose4)


### Name: import.graph.par
### Title: Imports Xpose graphics settings from a file to an Xpose data
###   object.
### Aliases: import.graph.par xpose.read

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
##D ## Command-line driven
##D xpdb5 <- xpose.read(xpdb5, "c:/XposeSettings/mytheme.ini")
## End(Not run)




