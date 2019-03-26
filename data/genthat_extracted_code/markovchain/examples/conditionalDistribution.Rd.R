library(markovchain)


### Name: conditionalDistribution
### Title: 'conditionalDistribution' of a Markov Chain
### Aliases: conditionalDistribution

### ** Examples

# define a markov chain
statesNames <- c("a", "b", "c")
markovB <- new("markovchain", states = statesNames, transitionMatrix = 
               matrix(c(0.2, 0.5, 0.3, 0, 1, 0, 0.1, 0.8, 0.1),nrow = 3, 
                      byrow = TRUE, dimnames = list(statesNames, statesNames)))
                      
conditionalDistribution(markovB, "b")                       




