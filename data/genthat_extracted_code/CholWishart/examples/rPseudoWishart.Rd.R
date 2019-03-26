library(CholWishart)


### Name: rPseudoWishart
### Title: Random Pseudo Wishart Distributed Matrices
### Aliases: rPseudoWishart

### ** Examples

set.seed(20181227)
A<-rPseudoWishart(1,4,5.0*diag(5))[,,1]
# A should be singular
eigen(A)$values




