library(markovchain)


### Name: is.irreducible
### Title: Function to check if a Markov chain is irreducible
### Aliases: is.irreducible

### ** Examples

statesNames <- c("a", "b")
mcA <- new("markovchain", transitionMatrix = matrix(c(0.7,0.3,0.1,0.9),
                                             byrow = TRUE, nrow = 2, 
                                             dimnames = list(statesNames, statesNames)
           ))
is.irreducible(mcA)



