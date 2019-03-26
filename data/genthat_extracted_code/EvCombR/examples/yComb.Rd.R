library(EvCombR)


### Name: yComb
### Title: Yager's Combination Operator
### Aliases: yComb

### ** Examples

# state space
stateSpace <- c("a", "b", "c")

# mass functions 
m1 <- mass(list("a"=0.1, "a/b/c"=0.9), stateSpace)
m2 <- mass(list("b"=0.2, "a/b/c"=0.8), stateSpace)

# Yager's combination
yComb(m1, m2)
# or 
yComb(list(m1, m2)) 




