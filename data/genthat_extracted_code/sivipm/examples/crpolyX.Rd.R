library(sivipm)


### Name: crpolyX
### Title: Create polyX Object from Standard Polynomial
### Aliases: crpolyX

### ** Examples

X <- cornell0[,1:3]
# Creation of the polynomial of degree 2 including the power terms:
# P= X1 + X2 + X3 + X1*X1 + X2*X2 + X3*X3 
P <- crpolyX(X, 2, type="power")



