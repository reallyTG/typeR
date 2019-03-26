library(jomo)


### Name: jomo1rancat
### Title: JM Imputation of clustered data with categorical variables
### Aliases: jomo1rancat

### ** Examples


attach(cldata)

#we define all the inputs:
# nimp, nburn and nbetween are smaller than they should. This is
#just because of CRAN policies on the examples.

Y.cat=data.frame(social)
Y.numcat=matrix(4,1,1)
X=data.frame(rep(1,1000),sex)
Z<-data.frame(rep(1,1000))
clus<-data.frame(city)
beta.start<-matrix(0,2,3)
u.start<-matrix(0,10,3)
l1cov.start<-diag(1,3)
l2cov.start<-diag(1,3)
l1cov.prior=diag(1,3);
l2cov.prior=diag(1,3);
nburn=as.integer(100);
nbetween=as.integer(100);
nimp=as.integer(4);

#And finally we run the imputation function:

imp<-jomo1rancat(Y.cat, Y.numcat, X,Z,clus,beta.start,u.start,l1cov.start, 
               l2cov.start,l1cov.prior,l2cov.prior,nburn,nbetween,nimp)

 cat("Original value was missing (",imp[3,1],"), imputed value:", imp[1003,1])
             




