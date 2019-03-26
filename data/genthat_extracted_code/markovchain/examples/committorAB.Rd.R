library(markovchain)


### Name: committorAB
### Title: Calculates committor of a markovchain object with respect to set
###   A, B
### Aliases: committorAB

### ** Examples

transMatr <- matrix(c(0,0,0,1,0.5,
                      0.5,0,0,0,0,
                      0.5,0,0,0,0,
                      0,0.2,0.4,0,0,
                      0,0.8,0.6,0,0.5),
                      nrow = 5)
object <- new("markovchain", states=c("a","b","c","d","e"),transitionMatrix=transMatr)
committorAB(object,c(5),c(3))




