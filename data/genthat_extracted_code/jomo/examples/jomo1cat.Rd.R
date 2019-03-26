library(jomo)


### Name: jomo1cat
### Title: JM Imputation of single level data with categorical variables
### Aliases: jomo1cat

### ** Examples

attach(sldata)

# we define all the inputs:
# nimp, nburn and nbetween are smaller than they should. This is
#just because of CRAN policies on the examples.

Y.cat=data.frame(social)
Y.numcat=matrix(4,1,1)
X=data.frame(rep(1,300),sex)
beta.start<-matrix(0,2,3)
l1cov.start<-diag(1,3)
l1cov.prior=diag(1,3);
nburn=as.integer(100);
nbetween=as.integer(100);
nimp=as.integer(5);

# Finally we run the sampler:

imp<-jomo1cat(Y.cat,Y.numcat,X,beta.start,l1cov.start,l1cov.prior,nburn,nbetween,nimp)

#See one of the imputed values:

cat("Original value was missing (",imp[16,1],"), imputed value:", imp[316,1])




