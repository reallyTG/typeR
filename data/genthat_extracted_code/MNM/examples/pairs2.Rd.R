library(MNM)


### Name: pairs2
### Title: Plotting two numeric matrices
### Aliases: pairs2
### Keywords: hplot

### ** Examples

X <- rmvnorm(50, c(0,0,1))
Y <- rmvnorm(50, c(20,1), matrix(rep(0.5,4),ncol=2))
colnames(X) <- LETTERS[1:3]
colnames(Y) <- letters[1:2]
pairs2(X,Y)



