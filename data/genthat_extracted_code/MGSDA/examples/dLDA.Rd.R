library(MGSDA)


### Name: dLDA
### Title: Estimate the matrix of discriminant vectors using L_1 penalty on
###   the rows
### Aliases: dLDA

### ** Examples

# Example 1
n=10
p=100
G=3
ytrain=rep(1:G,each=n)
set.seed(1)
xtrain=matrix(rnorm(p*n*G),n*G,p)
V=dLDA(xtrain,ytrain,lambda=0.1)
sum(rowSums(V)!=0) # number of non-zero rows



