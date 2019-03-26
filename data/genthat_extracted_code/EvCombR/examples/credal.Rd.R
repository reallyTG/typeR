library(EvCombR)


### Name: credal
### Title: Constructor Function for Credal Sets (based on intervals)
### Aliases: credal

### ** Examples

# state space
stateSpace <- c("a", "b", "c")

# lower and upper bounds for probability intervals
c1 <- credal(c(0.1, 0.1, 0.1), c(0.8, 0.8, 0.8), stateSpace)

# single probability function (lower and upper bounds of probability intervals are equal)
c2 <- credal(c(0.1, 0.2, 0.7), c(0.1, 0.2, 0.7), stateSpace)




