library(EvCombR)


### Name: cComb
### Title: Credal Combination Operator (restricted to intervals)
### Aliases: cComb

### ** Examples

# construct a state space
stateSpace <- c("a", "b", "c")

# construct credal sets with the given state space
c1 <- credal(c(0.1, 0.1, 0.1), c(0.8, 0.8, 0.8), stateSpace)
c2 <- credal(c(0.2, 0.2, 0.2), c(0.9, 0.9, 0.9), stateSpace)

# combine the credal sets
cComb(c1, c2)
# or by
cComb(list(c1, c2))




