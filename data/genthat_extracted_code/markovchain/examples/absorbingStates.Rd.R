library(markovchain)


### Name: absorbingStates
### Title: Various function to perform structural analysis of DTMC
### Aliases: absorbingStates transientStates
###   transientStates,markovchain-method canonicForm communicatingClasses
###   recurrentClasses period

### ** Examples

statesNames <- c("a", "b", "c")
markovB <- new("markovchain", states = statesNames, transitionMatrix =
                   matrix(c(0.2, 0.5, 0.3,
                              0,   1,   0,
                            0.1, 0.8, 0.1), nrow = 3, byrow = TRUE, 
                            dimnames = list(statesNames, statesNames)
              ))
              
communicatingClasses(markovB)               
recurrentClasses(markovB)
absorbingStates(markovB)
transientStates(markovB)
canonicForm(markovB)

# periodicity analysis : 1
E <- matrix(c(0, 1, 0, 0, 0.5, 0, 0.5, 0, 0, 0.5, 0, 0.5, 0, 0, 1, 0), 
            nrow = 4, ncol = 4, byrow = TRUE)
mcE <- new("markovchain", states = c("a", "b", "c", "d"), 
          transitionMatrix = E, 
          name = "E")

is.irreducible(mcE) #true
period(mcE) #2

# periodicity analysis : 2
myMatr <- matrix(c(0, 0, 1/2, 1/4, 1/4, 0, 0,
                   0, 0, 1/3, 0, 2/3, 0, 0,
                   0, 0, 0, 0, 0, 1/3, 2/3,
                   0, 0, 0, 0, 0, 1/2, 1/2,
                   0, 0, 0, 0, 0, 3/4, 1/4,
                   1/2, 1/2, 0, 0, 0, 0, 0,
                   1/4, 3/4, 0, 0, 0, 0, 0), byrow = TRUE, ncol = 7)
myMc <- new("markovchain", transitionMatrix = myMatr)
period(myMc)




