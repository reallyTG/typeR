library(groupRemMap)


### Name: group.remmap
### Title: A function to fit the regularized multivariate regression model
###   using the GroupRemMap penalty.
### Aliases: group.remmap
### Keywords: methods

### ** Examples



############################################
############# Generate an example data set
############################################
n=20 
#number of predictors
p=9 
#number of response variables
q=4
set.seed(1)

###assume predictors falling into 3 groups, and the sizes of group 1
#group 2, and group 3 to be 3, 2, 4, respectively
G=c(1,1,1,2,2,3,3,3,3) 

### generate X matrix
rho=0.5; Sig<-matrix(0,p,p)
for(i in 2:p){ for(j in 1: (i-1)){
    Sig[i,j]<-rho^(abs(i-j))
    Sig[j,i]<-Sig[i,j]
}}
diag(Sig)<-1
R<-chol(Sig)
X.m<-matrix(rnorm(n*p),n,p)
X.m<-X.m


######################################################
#############Create coefficient matrix, B#############
######################################################
B=matrix(0, p, q)

set.seed(100)        
#number of predictors in each group
sz.group=c(3,2,4)
cumsum.group.sz=cumsum(sz.group)
#number of significant predictors in each group
num.sig.in.group=c(2,1,3) 

###--Generate coefficients for group 1, allowing 
###--every predictor in this group to predict the 
###--the same subset of responses
#number of significant preditors, 2
num.sig.x=num.sig.in.group[1]   
#numbers of responses predicted for each significant predictor
num.reg.y=c(3,1)
#indices of the significant predictors in group 1
ids.sig.x.tmp=sample(sz.group[1], num.sig.x)
#indices of all the responses that are predicted by predictors in group 1
ids.reg.y.tmp=sample(q, max(num.reg.y))
#indices of the responses that are predicted by each predictor in group 1
idxs.reg.y.tmp=sapply(num.reg.y, function (x) sample(ids.reg.y.tmp, x))

#Generate coefficient for each row of the coefficient matrix
for(idx.tmp in 1:num.sig.x)
{
    r=ids.sig.x.tmp[idx.tmp]
    c=idxs.reg.y.tmp[[idx.tmp]]
    B[r,c]=runif(num.reg.y[idx.tmp], min=1,max=4) #
}
#        

###--Generate coefficients for group 2

num.sig.x=num.sig.in.group[2]   
num.reg.y=2
ids.sig.x.tmp=sample(sz.group[2], num.sig.x)
ids.reg.y.tmp=sample(q, max(num.reg.y))
idxs.reg.y.tmp=list(as.numeric(sapply(num.reg.y, function (x) sample(ids.reg.y.tmp, x))))

#Generate coefficient for each row of the coefficient matrix
for(idx.tmp in 1:num.sig.x)
{
    r=cumsum.group.sz[1]+ids.sig.x.tmp[idx.tmp]
    c=idxs.reg.y.tmp[[idx.tmp]]

    B[r,c]=runif(num.reg.y[idx.tmp], min=1,max=4) #
}
#        



###--Generate coefficients for group 3,

num.sig.x=num.sig.in.group[3]   
num.reg.y=c(1,2,2)
ids.sig.x.tmp=sample(sz.group[3], num.sig.x)
ids.reg.y.tmp=sample(q, max(num.reg.y))
idxs.reg.y.tmp=sapply(num.reg.y, function (x) sample(ids.reg.y.tmp, x))

#Generate coefficient for each row of the coefficient matrix
for(idx.tmp in 1:num.sig.x)
{
    r=cumsum.group.sz[2]+ids.sig.x.tmp[idx.tmp]
    c=idxs.reg.y.tmp[[idx.tmp]]

    B[r, c]=runif(num.reg.y[idx.tmp], min=1,max=4) #
}
#        
 


##############################################
### generate responses
##############################################
E.m<-matrix(rnorm(n*q),n,q)
Y.m<-X.m


###############################################
############ perform analysis
##############################################

###############################################
## 1. ## fit model for one pair of (lamL1, lamL2)
###############################################

try1=group.remmap(X.m, Y.m, G=G, lam1=100, lam2=50, gamma=0.5, phi0=NULL, C.m=NULL)


###############################################
## 2. ## Select tuning parameters with v-fold cross-validation;
##    cv based on unshrinked estimator (ols.cv) is recommended over cv
##    based on shrinked estimator (rss.cv); 
###   ## the latter tends to select large models.
################################################

lamL1.v=exp(seq(log(8), log(15), length=5))
lamL2.v=seq(10, 20, length=5)
try2=group.remmap.cv(X=X.m, Y=Y.m, G=G, lamL1.v, lamL2.v, C.m=NULL, fold=10, seed=1)
 
############# use CV based on unshrinked estimator (ols.cv)
pick=which.min(as.vector(try2$ols.cv))
lamL1.pick=try2$l.index[1,pick]    ##find the optimal (LamL1,LamL2) based on the cv score
lamL2.pick=try2$l.index[2,pick]
##fit the GroupRemMap model under the optimal (LamL1,LamL2).
result=group.remmap(X.m, Y.m, G=G, lam1=lamL1.pick, lam2=lamL2.pick, phi0=NULL, C.m=NULL)  

## number of false positives at the individual predictor level
FP=sum(B[result$phi!=0]==0) 
## number of false negatives at the individual predictor level
FN=sum(B[result$phi==0]!=0)
##CV (unshrinked) selected tuning parameters
#print(paste("lamL1=", round(lamL1.pick,3), "; lamL2=", round(lamL2.pick,3), sep="")) 
print(paste("False Postive=", FP, "; False Negative=", FN, sep=""))

## number of errors at the group level
group.selection.matrix=aggregate(result$phi, list(G), function (x) any(x>=1e-6)+0)
true.group.selection.in.B=aggregate(B, list(G), function (x) any(x>=1e-3)+0)
## number of false positives at the group level
FP.group=sum(true.group.selection.in.B[,-1][group.selection.matrix[,-1]==1]==0)
## number of false negatives at the group level
FN.group=sum(true.group.selection.in.B[,-1][group.selection.matrix[,-1]==0]!=0)
print(paste("Group level FP=", FP.group, "; group level FN=", FN.group, sep=""))



############# use CV based on shrinked estimator (rss.cv); it tends to
#############select very large models: thus is not recommended in general
pick=which.min(as.vector(try2$rss.cv))
lamL1.pick=try2$l.index[1,pick]    ##find the optimal (LamL1,LamL2) based on the cv score
lamL2.pick=try2$l.index[2,pick]
##fit the GroupRemMap model under the optimal (LamL1,LamL2).
result=group.remmap(X.m, Y.m, G=G, lam1=lamL1.pick, lam2=lamL2.pick, phi0=NULL, C.m=NULL)
## number of false positives
FP=sum(B[result$phi!=0]==0) 
FN=sum(B[result$phi==0]!=0)  ## number of false negatives
##CV (shrinked) selected tuning parameters
#print(paste("lamL1=", round(lamL1.pick,3), "; lamL2=", round(lamL2.pick,3), sep="")) 
print(paste("False Positive=", FP, "; False Negative=", FN, sep=""))



## number of false positive at the group level
FP.group=sum(true.group.selection.in.B[,-1][group.selection.matrix[,-1]==1]==0)
## number of false positive at the group level
FN.group=sum(true.group.selection.in.B[,-1][group.selection.matrix[,-1]==0]!=0)
print(paste("Group level FP=", FP.group, "; group level FN=", FN.group, sep=""))





