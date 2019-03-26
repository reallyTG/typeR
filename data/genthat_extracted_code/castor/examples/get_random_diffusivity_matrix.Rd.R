library(castor)


### Name: get_random_diffusivity_matrix
### Title: Create a random diffusivity matrix for a Brownian motion model.
### Aliases: get_random_diffusivity_matrix
### Keywords: BM model random

### ** Examples

# generate a 5x5 diffusivity matrix
D = get_random_diffusivity_matrix(Ntraits=5)

# check that it is indeed positive definite
if(all(eigen(D)$values>0)){ 
  cat("Indeed positive definite\n");
}else{ 
  cat("Not positive definite\n"); 
}



