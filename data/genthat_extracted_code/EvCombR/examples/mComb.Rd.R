library(EvCombR)


### Name: mComb
### Title: Modified Dempster's Combination Operator
### Aliases: mComb

### ** Examples

# state space
stateSpace <- c("a", "b", "c")

# mass functions 
m1 <- mass(list("a"=0.1, "a/b/c"=0.9), stateSpace)
m2 <- mass(list("a"=0.2, "a/b/c"=0.8), stateSpace)

# modified Dempster's combination using the uniform prior
mComb(m1, m2)
# or 
mComb(list(m1, m2))     

# modified Dempster's combination using a specific prior
mComb(m1, m2, list("a"=0.1, "b"=0.1, "c"=0.8))
# or 
mComb(list(m1, m2), list("a"=0.1, "b"=0.1, "c"=0.8)) 



