library(markovchain)


### Name: markovchainSequence
### Title: Function to generate a sequence of states from homogeneous
###   Markov chains.
### Aliases: markovchainSequence

### ** Examples

# define the markovchain object
statesNames <- c("a", "b", "c")
mcB <- new("markovchain", states = statesNames, 
   transitionMatrix = matrix(c(0.2, 0.5, 0.3, 0, 0.2, 0.8, 0.1, 0.8, 0.1), 
   nrow = 3, byrow = TRUE, dimnames = list(statesNames, statesNames)))

# show the sequence
outs <- markovchainSequence(n = 100, markovchain = mcB, t0 = "a")




