library(jomo)


### Name: jomo1ranconhr
### Title: JM Imputation of clustered data with continuous variables only
###   with cluster-specific covariance matrices
### Aliases: jomo1ranconhr

### ** Examples


attach(cldata)

# we define the inputs
# nimp, nburn and nbetween are smaller than they should. This is
#just because of CRAN policies on the examples.

Y<-data.frame(measure,age)
X<-data.frame(rep(1,1000),sex)
Z<-data.frame(rep(1,1000))
clus<-data.frame(city)
beta.start<-matrix(0,2,2)
u.start<-matrix(0,10,2)
l1cov.start<-matrix(diag(1,2),20,2,2)
l2cov.start<-diag(1,2)
l1cov.prior=diag(1,2);
nburn=as.integer(50);
nbetween=as.integer(20);
nimp=as.integer(5);
l2cov.prior=diag(1,5);
a=3

# Finally we run either the model with fixed or random cluster-specific covariance matrices:

imp<-jomo1ranconhr(Y,X,Z,clus,beta.start,u.start,l1cov.start, l2cov.start,
         l1cov.prior,l2cov.prior,nburn,nbetween,nimp,meth="fixed")

cat("Original value was missing(",imp[4,1],"), imputed value:", imp[1004,1])

#or:

#imp<-jomo1ranconhr(Y,X,Z,clus,beta.start,u.start,l1cov.start, l2cov.start,
#        l1cov.prior,l2cov.prior,nburn,nbetween,nimp,a,meth="random")

# Then we analyse the imputed datasets:

estimates<-rep(0,5)
ses<-rep(0,5)
estimates2<-rep(0,5)
ses2<-rep(0,5)
for (i in 1:5) {
  dat<-imp[imp$Imputation==i,]
  fit<-lm(measure~age+sex+factor(clus),data=dat)
  estimates[i]<-coef(summary(fit))[2,1]
  ses[i]<-coef(summary(fit))[2,2]
  estimates2[i]<-coef(summary(fit))[3,1]
  ses2[i]<-coef(summary(fit))[3,2]
}

# And finally we combine results with Rubin's rules, using package BaBooN.

#library("BaBooN")
#MI.inference(estimates, ses^2)
#MI.inference(estimates2, ses2^2)



