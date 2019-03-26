library(HiddenMarkov)


### Name: Transform-Parameters
### Title: Transform Transition or Rate Matrices to Vector
### Aliases: Transform-Parameters Pi2vector vector2Pi Q2vector vector2Q
### Keywords: optimize misc

### ** Examples

Pi <- matrix(c(0.8, 0.1, 0.1,
               0.1, 0.6, 0.3,
               0.2, 0.3, 0.5),
             byrow=TRUE, nrow=3)

print(vector2Pi(Pi2vector(Pi)))

#------------------------------------------------

Q <- matrix(c(-8,  5,  3,
               1, -4,  3,
               2,  5, -7),
            byrow=TRUE, nrow=3)

print(vector2Q(Q2vector(Q)))



