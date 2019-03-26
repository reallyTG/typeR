library(pracma)


### Name: randortho
### Title: Generate Random Orthonormal or Unitary Matrix
### Aliases: randortho
### Keywords: math

### ** Examples

Q <- randortho(5)
zapsmall(Q %*% t(Q))
zapsmall(t(Q) %*% Q)



