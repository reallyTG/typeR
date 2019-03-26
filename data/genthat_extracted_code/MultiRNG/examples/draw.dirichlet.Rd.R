library(MultiRNG)


### Name: draw.dirichlet
### Title: Pseudo-Random Number Generation under Multivariate Beta
###   (Dirichlet) Distribution
### Aliases: draw.dirichlet

### ** Examples

alpha.vec=c(1,3,4,4)
mydata=draw.dirichlet(no.row=1e5,d=4,alpha=alpha.vec,beta=2)
apply(mydata,2,mean)-alpha.vec/sum(alpha.vec)



