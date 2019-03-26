library(CARRoT)


### Name: regr_ind
### Title: Indices of the best regressions
### Aliases: regr_ind

### ** Examples

#creating variables for linear regression mode

variables_lin<-matrix(c(rnorm(56,0,1),rnorm(56,1,2)),ncol=2)

#creating outcomes for linear regression mode

outcomes_lin<-rnorm(56,2,1)

#running the function

regr_ind(variables_lin,outcomes_lin,100,mode='linear',parallel=TRUE,cores=2)

#creating variables for binary mode

vari<-matrix(c(1:100,seq(1,300,3)),ncol=2)

#creating outcomes for binary mode

out<-rbinom(100,1,0.3)

#running the function

regr_ind(vari,out,20,cutoff=0.5,part=10,mode='binary',parallel=TRUE,cores=2,nr=c(1,10,20),maxx=1)



