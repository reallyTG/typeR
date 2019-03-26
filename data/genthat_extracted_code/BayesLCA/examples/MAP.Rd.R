library(BayesLCA)


### Name: MAP
### Title: Maximum _a posteriori_ (MAP) Classification
### Aliases: MAP unMAP
### Keywords: map unmap

### ** Examples

##Simple example
s1<- sample(1:2, 10, replace=TRUE)
unMAP(s1)
MAP(unMAP(s1))

##More to the point
data(Alzheimer)
fit<- blca.em(Alzheimer, 2)
MAP(fit$Z) ## Best estimates of group membership. 

mat1<- matrix(1/3, nrow=10, ncol=3) ##demonstrating the use of "tie" argument
MAP(mat1, tie="random")
MAP(mat1, tie="standard")



