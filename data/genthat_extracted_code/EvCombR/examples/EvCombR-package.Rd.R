library(EvCombR)


### Name: EvCombR-package
### Title: EvCombR - Evidence Combination in R
### Aliases: EvCombR-package EvCombR
### Keywords: package

### ** Examples

# construct a state space
stateSpace <- c("a", "b", "c")

# construct credal sets with the given state space
c1 <- credal(c(0.1, 0.1, 0.1), c(0.8, 0.8, 0.8), stateSpace)
c2 <- credal(c(0.2, 0.2, 0.2), c(0.9, 0.9, 0.9), stateSpace)

# combine the credal sets
cComb(c1, c2)

# construct mass functions
m1 <- mass(list("a"=0.1, "b"=0.1 , "c"=0.4, "a/b/c"=0.4), stateSpace)
m2 <- mass(list("a"=0.2, "b"=0.2, "c"=0.2, "a/b/c"=0.4), stateSpace)

# combine the mass functin by using Dempster's combination
dComb(m1, m2)

# Yager's combination operator
yComb(m1, m2)

# modified Dempster's combination using uniform prior
mComb(m1, m2)




