library(corHMM)


### Name: rate.mat.maker
### Title: Rate matrix maker
### Aliases: rate.mat.maker rate.par.drop rate.par.eq
### Keywords: models

### ** Examples

#Generate a matrix for two binary traits:
rate.mat<-rate.mat.maker(hrm=FALSE,ntraits=2,model="ARD")
#Drop parameter 8 from the model
rate.mat<-rate.par.drop(rate.mat, drop.par=c(8))
#Set parameters 1 and 2 equal to one another:
rate.mat<-rate.par.eq(rate.mat, eq.par=c(1,2))

#Precursor model. There are many ways to do this, but here is one way 
rate.mat<-rate.mat.maker(hrm=TRUE,rate.cat=2)
rate.mat<-rate.par.drop(rate.mat,c(1,3,4,6,7,8))
rate.mat<-rate.par.eq(rate.mat,c(1,2))
#Now add in a couple more connections:
rate.mat[3,2]<-1
rate.mat[2,3]<-1
#Now just use this matrix when using the corHMM function

#Here is a one way of doing a more complicated precursor:
rate.mat[3,2]<-2
rate.mat[1,3]<-3
rate.mat[2,3]<-4
#Again, just use this matrix when using the corHMM function

#Finally, here is an easier way of doing the precursor:
rate.mat<-rate.mat.maker(hrm=TRUE,rate.cat=2)
rate.mat<-rate.par.drop(rate.mat,c(1,3,4,7))
rate.mat[!is.na(rate.mat)]<-1

#Not run
# pp<-corHMM(primates$tree,primates$trait,rate.cat=2,rate.mat=rate.mat,
# node.states="marginal",diagn=FALSE)




