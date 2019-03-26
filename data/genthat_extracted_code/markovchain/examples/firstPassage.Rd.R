library(markovchain)


### Name: firstPassage
### Title: First passage across states
### Aliases: firstPassage

### ** Examples

simpleMc <- new("markovchain", states = c("a", "b"),
                 transitionMatrix = matrix(c(0.4, 0.6, .3, .7), 
                                    nrow = 2, byrow = TRUE))
firstPassage(simpleMc, "b", 20)




