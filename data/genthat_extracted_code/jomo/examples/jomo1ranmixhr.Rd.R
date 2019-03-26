library(jomo)


### Name: jomo1ranmixhr
### Title: JM Imputation of clustered data with mixed variable types with
###   cluster-specific covariance matrices
### Aliases: jomo1ranmixhr

### ** Examples


attach(cldata)

#we define all the inputs:
# nimp, nburn and nbetween are smaller than they should. This is
#just because of CRAN policies on the examples.

Y.con=data.frame(measure,age)
Y.cat=data.frame(social)
Y.numcat=matrix(4,1,1)
X=data.frame(rep(1,1000),sex)
Z<-data.frame(rep(1,1000))
clus<-data.frame(city)
beta.start<-matrix(0,2,5)
u.start<-matrix(0,10,5)
l1cov.start<-matrix(diag(1,5),50,5,2)
l2cov.start<-diag(1,5)
l1cov.prior=diag(1,5);
l2cov.prior=diag(1,5);
nburn=as.integer(80);
nbetween=as.integer(50);
nimp=as.integer(5);
a=6

# And we are finally able to run the imputation:

imp<-jomo1ranmixhr(Y.con, Y.cat, Y.numcat, X,Z,clus,beta.start,u.start,l1cov.start, 
        l2cov.start,l1cov.prior,l2cov.prior,nburn,nbetween,nimp, a, meth="random")

cat("Original value was missing (",imp[4,1],"), imputed value:", imp[1004,1])

#We analyse our imputed datasets with standard techniques:

estimates<-matrix(0,5,5)
ses<-matrix(0,5,5)
for (i in 1:5) {
  dat<-imp[imp$Imputation==i,]
  fit<-lm(measure~age+sex+factor(social)+factor(clus),data=dat)
  estimates[i,1:5]<-coef(summary(fit))[2:6,1]
  ses[i,1:5]<-coef(summary(fit))[2:6,2]
}

# And to conclude, we aggregate estimates with Rubin's rules, using BaBooN package:

#library("BaBooN")
#MI.inference(estimates[,1], ses[,1]^2)
#MI.inference(estimates[,2], ses[,2]^2)
#MI.inference(estimates[,3], ses[,3]^2)
#MI.inference(estimates[,4], ses[,4]^2)
#MI.inference(estimates[,5], ses[,5]^2)




