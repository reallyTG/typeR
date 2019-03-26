library(markovchain)


### Name: name
### Title: Method to retrieve name of markovchain object
### Aliases: name name,markovchain-method

### ** Examples

statesNames <- c("a", "b", "c")
markovB <- new("markovchain", states = statesNames, transitionMatrix =
                matrix(c(0.2, 0.5, 0.3, 0, 1, 0, 0.1, 0.8, 0.1), nrow = 3,
                byrow = TRUE, dimnames=list(statesNames,statesNames)),
               name = "A markovchain Object" 
)
name(markovB)




