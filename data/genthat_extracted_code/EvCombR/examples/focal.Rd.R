library(EvCombR)


### Name: focal
### Title: Focal Elements of a Mass Function
### Aliases: focal

### ** Examples

# state space
stateSpace <- c("a", "b", "c")

# mass functions 
m <- mass(list("a"=0.1, "b"=0.1 , "c"=0.4, "a/b/c"=0.4), stateSpace)

# obtain focal elements
focal(m)



