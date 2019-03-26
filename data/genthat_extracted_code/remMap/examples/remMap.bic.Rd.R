library(remMap)


### Name: remMap.BIC
### Title: Fit remMap models for a series of tuning parameters and return
###   the corresponding BIC scores.
### Aliases: remMap.BIC
### Keywords: methods

### ** Examples


############################################
############# Generate an example data set
############################################
n=50
p=30
q=30
set.seed(1)

## generate X matrix
X.m<-matrix(rnorm(n*p),n,p)

## generate coefficient
coef.m<-matrix(0,p,q)
hub.n=10
hub.index=sample(1:p, hub.n)
for(i in 1:q){
  cur=sample(1:3,1)
  temp=sample(hub.index, cur)
  coef.m[temp,i]<-runif(length(temp), min=2, max=3)
 }

## generate responses
E.m<-matrix(rnorm(n*q),n,q)
Y.m<-X.m

##############################################
# 1. ## fit model for one pair of (lamL1, lamL2)
##############################################

try1=remMap(X.m, Y.m,lamL1=10, lamL2=5, phi0=NULL, C.m=NULL)

################################################################################################
# 2. ## Select tuning parameters with BIC:
##   ## computationally easy; but the BIC procedure assumes orthogonality of the design matrix
##   ## to estimate the degrees of freedom;
##   ## thus it tends to select too small models when the actual design matrix (X.m) is far
##   ##  from orthogonal
################################################################################################

lamL1.v=exp(seq(log(10),log(20), length=3))
lamL2.v=seq(0,5, length=3)
df.m=remMap.df(X.m, Y.m, lamL1.v, lamL2.v, C.m=NULL)
##  The estimated degrees of freedom can be used to select the ranges of tuning parameters.

try2=remMap.BIC(X.m, Y.m,lamL1.v, lamL2.v, C.m=NULL)
pick=which.min(as.vector(t(try2$BIC)))
result=try2$phi[[pick]]
FP=sum(result$phi!=0 & coef.m==0) ## number of false positives
FN=sum(result$phi==0 & coef.m!=0) ## number of false negatives

#BIC selected tuning parameters
print(paste("lamL1=", round(result$lam1,3), "; lamL2=", round(result$lam2,3), sep=""))
print(paste("FP=", FP, "; FN=", FN, sep=""))

#################################################################################################
# 3. ## Select tuning parameters with v-fold cross-validation;
##   ## computationally demanding;
##   ## but cross-validation assumes less assumptions than BIC and thus is recommended unless
##   ## computation is a concern;
#    ## alos cv based on unshrinked estimator (ols.cv) is recommended over cv based on shrinked
##   ## estimator (rss.cv);
##   ## the latter tends to select too large models.
################################################################################################

lamL1.v=exp(seq(log(10),log(20), length=3))
lamL2.v=seq(0,5, length=3)
try3=remMap.CV(X=X.m, Y=Y.m,lamL1.v, lamL2.v, C.m=NULL, fold=5, seed=1)

############ use CV based on unshrinked estimator (ols.cv)
pick=which.min(as.vector(try3$ols.cv))
#pick=which.min(as.vector(try3$rss.cv))
lamL1.pick=try3$l.index[1,pick]    ##find the optimal (LamL1,LamL2) based on the cv score
lamL2.pick=try3$l.index[2,pick]
##fit the remMap model under the optimal (LamL1,LamL2).
result=remMap(X.m, Y.m,lamL1=lamL1.pick, lamL2=lamL2.pick, phi0=NULL, C.m=NULL)
FP=sum(result$phi!=0 & coef.m==0) ## number of false positives
FN=sum(result$phi==0 & coef.m!=0) ## number of false negatives
##CV (unshrinked) selected tuning parameters
print(paste("lamL1=", round(lamL1.pick,3), "; lamL2=", round(lamL2.pick,3), sep=""))
print(paste("FP=", FP, "; FN=", FN, sep=""))




