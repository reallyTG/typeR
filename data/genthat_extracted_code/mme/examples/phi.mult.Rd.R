library(mme)


### Name: phi.mult
### Title: Initial values for the variance components for Model 1
### Aliases: phi.mult
### Keywords: models

### ** Examples

k=3 #number of categories of the response variable
pp=c(1,1) #vector with the number of auxiliary variables in each category
data(simdata) #data
mod=1 #type of model
datar=data.mme(simdata,k,pp,mod)
###beta values
beta.new=list()
beta.new[[1]]=matrix(c( 1.3,-1),2,1)
beta.new[[2]]=matrix(c( -1.6,1),2,1)

##Initial variance components
phi=phi.mult(beta.new,datar$y,datar$Xk,datar$n)



