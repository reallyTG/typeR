library(EvCombR)


### Name: [[-methods
### Title: Methods for Function '[['
### Aliases: [[-methods [[,mass,character,missing-method
### Keywords: methods

### ** Examples

# construct a state space
stateSpace <- c("a", "b", "c")

#mass functions 
m <- mass(list("a"=0.1, "b"=0.1 , "c"=0.4, "a/b/c"=0.4), stateSpace)  

# extract focal element
m[["a"]]



