library(EvCombR)


### Name: disc
### Title: Discounting Operator
### Aliases: disc

### ** Examples

# state space
stateSpace <- c("a", "b", "c")

# mass function 
m <- mass(list("a"=0.1, "a/b/c"=0.9), stateSpace)

# source is only 80% reliable
mDisc <- disc(m, 0.8)



