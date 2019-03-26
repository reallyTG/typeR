library(EvCombR)


### Name: focal<-
### Title: Replacement Function for Focal Elements
### Aliases: focal<-

### ** Examples

# state space
stateSpace <- c("a", "b", "c")

# mass functions 
m <- mass(list("a"=0.1, "b"=0.1 , "c"=0.4, "a/b/c"=0.4), stateSpace)

# replace focal elements
focal(m) <- list("a/b"=1)



