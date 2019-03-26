library(survey)


### Name: paley
### Title: Paley-type Hadamard matrices
### Aliases: paley is.hadamard
### Keywords: survey algebra

### ** Examples


M<-paley(11)

is.hadamard(M)
## internals of is.hadamard(M)
H<-2*M-1
## HH^T is diagonal for any Hadamard matrix
H%*%t(H)




