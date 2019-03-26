library(NetworkDistance)


### Name: nd.csd
### Title: L_2 Distance of Continuous Spectral Densities
### Aliases: nd.csd

### ** Examples

## Not run: 
##D ## generate two types of adjacency matrices of size (3-by-3)
##D set.seed(45)
##D rbin1 = rbinom(9,1,0.8); mat1 = matrix(rbin1,nrow=3)
##D rbin2 = rbinom(9,1,0.2); mat2 = matrix(rbin2,nrow=3)
##D 
##D mattype1 = ceiling((mat1+t(mat1))/2); diag(mattype1)=0;
##D mattype2 = ceiling((mat2+t(mat2))/2); diag(mattype2)=0;
##D 
##D A = list()
##D for (i in 1:3){A[[i]]=mattype1} # first 3 are type-1
##D for (i in 4:6){A[[i]]=mattype2} # next  3 are type-2
##D 
##D ## Compute Distance Matrix and Visualize
##D output = nd.csd(A, out.dist=FALSE, bandwidth=1.0)
##D image(output$D, main="two group case")
## End(Not run)




