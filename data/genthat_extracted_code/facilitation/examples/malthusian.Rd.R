library(facilitation)


### Name: malthusian
### Title: A single species, 3 stages, no interactions simulation result
### Aliases: malthusian
### Keywords: datasets

### ** Examples

## Simple mathusian one species
init <- c(0,0,100)
################# D G R disp
param <- matrix(c(5,1,0,5, 1,1,0,5, .5,0,10,5),nrow=3,byrow=TRUE)
malthusian <- community(10,3,param,init)



