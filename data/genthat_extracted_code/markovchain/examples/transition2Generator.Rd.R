library(markovchain)


### Name: transition2Generator
### Title: Return the generator matrix for a corresponding transition
###   matrix
### Aliases: transition2Generator

### ** Examples

mymatr <- matrix(c(.4, .6, .1, .9), nrow = 2, byrow = TRUE)
Q <- transition2Generator(P = mymatr)
expm::expm(Q)
 



