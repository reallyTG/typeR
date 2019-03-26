library(Maeswrap)


### Name: replacemetdata
### Title: Replace a weather variable
### Aliases: replacemetdata replacemetvar
### Keywords: utilities

### ** Examples

## Not run: 
##D 
##D #:::1.::: Replace precipitation with random number between 0 and 2.
##D # First find out how many records there are:
##D nrecords <- nrow(readmet("met.dat"))
##D 
##D # Make new rain
##D newrain <- runif(nrecords, 0, 2)
##D 
##D # And replace
##D replacemetvar("PPT",newrain,"met.dat", "newmet.dat")
##D 
##D 
##D #:::2.::: Replace multiple weather variables.
##D newtair <- runif(nrecords, 0, 35)
##D 
##D # Have to make a matrix of the variables to be replaced:
##D newmat <- matrix(cbind(newrain, newtair),ncol=2)
##D 
##D # And give a vector of variable names --in the same order as in the matrix!!--.
##D replacemetvar(c("PPT","TAIR"), newmat, "met.dat", "newmet.dat")
##D 
##D 
## End(Not run)



