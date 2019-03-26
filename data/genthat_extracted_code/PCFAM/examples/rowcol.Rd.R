library(PCFAM)


### Name: rowcol
### Title: Indicators for of the row and column of the original matrix
### Aliases: rowcol

### ** Examples

X <- matrix(rbinom(1000*20,2,0.4),1000,20)
X[,1]=X[,2]*0.9
X=rowscale(X)



