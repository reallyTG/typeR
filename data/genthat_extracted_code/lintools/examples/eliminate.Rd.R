library(lintools)


### Name: eliminate
### Title: Eliminate a variable from a set of edit rules
### Aliases: eliminate

### ** Examples


# Example from Williams (1986)
A <- matrix(c(
   4, -5, -3,  1,
  -1,  1, -1,  0,
   1,  1,  2,  0,
  -1,  0,  0,  0,
   0, -1,  0,  0,
   0,  0, -1,  0),byrow=TRUE,nrow=6) 
b <- c(0,2,3,0,0,0)
L <- eliminate(A=A, b=b, neq=0, nleq=6, variable=1)





