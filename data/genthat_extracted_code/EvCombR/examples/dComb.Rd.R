library(EvCombR)


### Name: dComb
### Title: Dempster's Combination Operator
### Aliases: dComb

### ** Examples

# state space
stateSpace <- c("a", "b", "c")

# mass functions 
m1 <- mass(list("a"=0.1, "a/b/c"=0.9), stateSpace)
m2 <- mass(list("a"=0.2, "a/b/c"=0.8), stateSpace)

# Dempster's combination
dComb(m1, m2)
# or 
dComb(list(m1, m2))



