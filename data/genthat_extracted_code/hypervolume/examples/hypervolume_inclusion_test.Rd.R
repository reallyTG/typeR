library(hypervolume)


### Name: hypervolume_inclusion_test
### Title: Inclusion test
### Aliases: hypervolume_inclusion_test

### ** Examples

## Not run: 
##D # construct a hypervolume of points in the unit square [0,1] x [0,1]
##D data = data.frame(x=runif(100,min=0,max=1), y=runif(100,min=0,max=1))
##D hv = hypervolume_gaussian(data)
##D 
##D # test if (0.5,0.5) and (-1,1) are in - should return TRUE FALSE
##D hypervolume_inclusion_test(hv, points=data.frame(x=c(0.5,-1),y=c(0.5,-1)))
## End(Not run)



