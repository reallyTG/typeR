library(primer)


### Name: pimmlawton
### Title: Analysis of Jacobian Lotka-Volterra Food Web Matrices
### Aliases: pimmlawton
### Keywords: methods

### ** Examples

### A relevant style of matrix for the first food chain in Pimm and Lawton (1977). 
### Note each non-zero element is the appropriate sign, and the maximum magnitude 
### specified by Pimm and Lawton (1977).

Aq = matrix(c(
   -1, -10,   0,   0,
  0.1,   0, -10,   0,
    0, 0.1,   0, -10,
    0,   0,  0.1,  0),
  nrow=4, byrow=TRUE)

pimmlawton(Aq, N=1)

out <- pimmlawton(Aq, N=2000)
out <- subset(out, -1/DomEig <150)
hist(-1/out$DomEig, main="Frequencies of Return Time")



