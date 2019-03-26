library(jomo)


### Name: jomo1ranmix
### Title: JM Imputation of clustered data with mixed variable types
### Aliases: jomo1ranmix

### ** Examples



attach(cldata)

# we define the inputs:
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
l1cov.start<-diag(1,5)
l2cov.start<-diag(1,5)
l1cov.prior=diag(1,5);
l2cov.prior=diag(1,5);
nburn=as.integer(100);
nbetween=as.integer(100);
nimp=as.integer(5);

#Then we can run the sampler:

imp<-jomo1ranmix(Y.con, Y.cat, Y.numcat, X,Z,clus,beta.start,u.start,l1cov.start, 
          l2cov.start,l1cov.prior,l2cov.prior,nburn,nbetween,nimp)

cat("Original value was missing (",imp[4,1],"), imputed value:", imp[1004,1])

# We run our substantive model on the 5 imputed datasets:

estimates<-matrix(0,5,5)
ses<-matrix(0,5,5)
for (i in 1:5) {
  dat<-imp[imp$Imputation==i,]
  fit<-lm(measure~age+sex+factor(social)+factor(clus),data=dat)
  estimates[i,1:5]<-coef(summary(fit))[2:6,1]
  ses[i,1:5]<-coef(summary(fit))[2:6,2]
}

# And finally we aggregate results with Rubin's rules, using BaBooN package:

#library("BaBooN")
#MI.inference(estimates[,1], ses[,1]^2)
#MI.inference(estimates[,2], ses[,2]^2)
#MI.inference(estimates[,3], ses[,3]^2)
#MI.inference(estimates[,4], ses[,4]^2)
#MI.inference(estimates[,5], ses[,5]^2)



