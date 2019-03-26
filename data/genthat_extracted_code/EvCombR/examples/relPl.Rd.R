library(EvCombR)


### Name: relPl
### Title: Relative Plausibility Transform
### Aliases: relPl

### ** Examples

# state space
stateSpace <- c("a", "b", "c")

# mass function 
m <- mass(list("a"=0.1, "a/b/c"=0.9), stateSpace)

# obtaina singleton credal set
c <- relPl(m)



