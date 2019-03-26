library(CholWishart)


### Name: rGenInvWishart
### Title: Random Generalized Inverse Wishart Distributed Matrices
### Aliases: rGenInvWishart

### ** Examples

set.seed(20181228)
A<-rGenInvWishart(1,4,5.0*diag(5))[,,1]
# A should be singular
eigen(A)$values




