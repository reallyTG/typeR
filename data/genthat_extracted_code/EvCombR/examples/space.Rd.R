library(EvCombR)


### Name: space
### Title: State Space of and Evidence Structure
### Aliases: space

### ** Examples

# state space
stateSpace <- c("a", "b", "c")

# construct mass function 
m <- mass(list("a"=0.1, "b"=0.1 , "c"=0.4, "a/b/c"=0.4), stateSpace)

# obtain state space
space(m)




