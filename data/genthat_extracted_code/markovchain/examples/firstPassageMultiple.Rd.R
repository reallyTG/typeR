library(markovchain)


### Name: firstPassageMultiple
### Title: function to calculate first passage probabilities
### Aliases: firstPassageMultiple

### ** Examples

statesNames <- c("a", "b", "c")
markovB <- new("markovchain", states = statesNames, transitionMatrix =
matrix(c(0.2, 0.5, 0.3,
         0, 1, 0,
         0.1, 0.8, 0.1), nrow = 3, byrow = TRUE,
       dimnames = list(statesNames, statesNames)
))
firstPassageMultiple(markovB,"a",c("b","c"),4)  




