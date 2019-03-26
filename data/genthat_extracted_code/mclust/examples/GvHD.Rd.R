library(mclust)


### Name: GvHD
### Title: GvHD Dataset
### Aliases: GvHD GvHD.pos GvHD.control
### Keywords: datasets

### ** Examples

## Not run: 
##D data(GvHD)
##D 
##D dat <- GvHD.pos[1:500,] # only a few lines for a quick example
##D 
##D output <- clustCombi(dat) 
##D 
##D output # is of class clustCombi
##D 
##D # plots the hierarchy of combined solutions, then some "entropy plots" which 
##D # may help one to select the number of classes
##D plot(output, dat) 
## End(Not run)




