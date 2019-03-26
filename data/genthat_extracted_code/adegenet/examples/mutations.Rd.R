library(adegenet)


### Name: findMutations
### Title: Identify mutations between DNA sequences
### Aliases: findMutations findMutations.DNAbin graphMutations
###   graphMutations.DNAbin

### ** Examples

## Not run: 
##D data(woodmouse)
##D 
##D ## mutations between first 3 sequences
##D findMutations(woodmouse[1:3,])
##D 
##D ## mutations from the first to sequences 2 and 3
##D findMutations(woodmouse[1:3,], from=1)
##D 
##D ## same, graphical display
##D g <- graphMutations(woodmouse[1:3,], from=1)
##D 
##D ## some manual checks
##D as.character(woodmouse)[1:3,35]
##D as.character(woodmouse)[1:3,36]
##D as.character(woodmouse)[1:3,106]
##D 
## End(Not run)



