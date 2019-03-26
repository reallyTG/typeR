library(mme)


### Name: phi.mult.ct
### Title: Initial values for the variance components in Model 3
### Aliases: phi.mult.ct
### Keywords: models

### ** Examples

k=3 #number of categories of the response variable
pp=c(1,1) #vector with the number of auxiliary variables in each category
mod=3  #type of model
data(simdata3) #data
D=nrow(simdata3)
datar=data.mme(simdata3,k,pp,mod)
###Fixed effects values
beta.new=list()
beta.new[[1]]=matrix(c( 1.3,-1),2,1)
beta.new[[2]]=matrix(c( -1.6,1),2,1)
## Random effects values
u1.new=rep(0.01,((k-1)*datar$d))
dim(u1.new)=c(datar$d,k-1)
u2.new=rep(0.01,((k-1)*D))
dim(u2.new)=c(D,k-1)

## Initial variance components
phi=phi.mult.ct(beta.new,datar$y,datar$Xk,datar$n,u1.new,u2.new)



