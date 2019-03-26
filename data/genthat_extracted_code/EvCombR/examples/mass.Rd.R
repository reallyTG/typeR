library(EvCombR)


### Name: mass
### Title: Constructor Function for Mass Functions
### Aliases: mass

### ** Examples

# state space
stateSpace <- c("a", "b", "c")

# construct mass functions 
m1 <- mass(list("a"=0.1, "b"=0.1 , "c"=0.4, "a/b/c"=0.4), stateSpace)
m2 <- mass(list("a"=0.1, "b"=0.1, "c"=0.1, "a/b"=0.1, "a/c"=0.1, 
                "b/c"=0.1, "a/b/c"=0.4), stateSpace)

# apply Yager's combination operator, m12 will be a massQ-object 
m12Q <- yComb(m1,m2)

# contruct a mass function from an massQ-object
m12 <- mass(m12Q)




