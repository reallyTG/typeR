library(EvCombR)


### Name: pign
### Title: Pignistic Tranformation
### Aliases: pign

### ** Examples

# state space
stateSpace <- c("a", "b", "c")

# mass function 
m <- mass(list("a"=0.1, "a/b/c"=0.9), stateSpace)

# obtaina singleton credal set
c <- pign(m)




