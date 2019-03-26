library(multisensi)


### Name: basis.mine
### Title: A function to decompose multivariate data on a user-defined
###   basis
### Aliases: basis.mine
### Keywords: dimension reduction

### ** Examples

data(biomasseY)
M <- 1*outer(sort(0:(ncol(biomasseY)-1)%%5),0:4,"==")
norm.M <- sqrt(colSums(M^2)) 
for (i in 1:ncol(M)){
    M[,i]=M[,i]/norm.M[i]
}

res <- basis.mine(biomasseY, basis.args=list(baseL=M))




