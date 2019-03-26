library(mme)


### Name: phi.mult.it
### Title: Initial values for the variance components in Model 2
### Aliases: phi.mult.it
### Keywords: models

### ** Examples

k=3 #number of categories of the response variable
pp=c(1,1) #vector with the number of auxiliary variables in each category
data(simdata2)  #data
mod=2 #Type of model
datar=data.mme(simdata2,k,pp,mod)
D=nrow(simdata2)
###fixed effects values
beta.new=list()
beta.new[[1]]=matrix(c( 1.3,-1),2,1)
beta.new[[2]]=matrix(c( -1.6,1),2,1)
## random effects values
u1.new=rep(0.01,((k-1)*datar$d))
dim(u1.new)=c(datar$d,k-1)
u2.new=rep(0.01,((k-1)*D))
dim(u2.new)=c(D,k-1)

##Initial variance components
phi=phi.mult.it(beta.new,datar$y,datar$Xk,datar$n,u1.new,u2.new)



