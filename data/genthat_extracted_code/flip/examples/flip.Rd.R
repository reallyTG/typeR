library(flip)


### Name: flip
### Title: flip
### Aliases: flip flip.statTest orthoZ
### Keywords: htest

### ** Examples


Y=matrix(rnorm(50),10,5)
colnames(Y)=LETTERS[1:5]
Y[,1:2]=Y[,1:2] +1
res = flip(Y)
res
plot(res[[1]])
plot(res[2:3])
plot(res)

X=rep(0:1,5)
Y=Y+matrix(X*2,10,5)

data=data.frame(Y,X=X, Z=rnorm(10))
#testing dependence among Y's and X
(res = flip(Y,~X,data=data))
#same as:
#res = flip(A+B+C+D+E~X,data=data)


#testing dependence among Y's and X, also using covariates
res = flip(Y,~X,~Z,data=data)
res
#Note that
#flip(Y,X=~X,Z=~1,data=data)
#is different from
#flip(Y,~X,data=data)
#since the former is based on orthogonalized residuals of Y and X by Z.

## Not run: 
##D #Rotation tests:
##D rot=flip(Y,X,Z=~1,testType="rotation")
##D # note the use Z=~1.
## End(Not run)

#Using rank tests:
res = flip(Y,~X,data=data,statTest="Wilcoxon")
res

#testing symmetry of Y around 0
Y[,1:2]=Y[,1:2] +2
res = flip(Y)
res
plot(res)


#use of strata (in this case equal to paired samples)
data$S=rep(1:5,rep(2,5))
#paired t
flip(A+B+C+D+E~X,data=data,statTest="t",Strata=~S)
#signed Rank test
flip(A+B+C+D+E~X,data=data,statTest="Wilcox",Strata=~S)

# tests for categorical data
data=data.frame(X=rep(0:2,10))
data=data.frame(X=factor(data$X),Y=factor(rbinom(30,2,.2+.2*data$X)))
flip(~Y,~X,data=data,statTest="chisq")
# separated chisq (Finos and Salmaso, 2004. Nonparametric multi-focus analysis
# for categorical variables. CommStat - T.M.)
(res.sep=flip(~Y,~X,data=data,statTest="chisq.separated"))
npc(res.sep,"sumT2") #note that combined test statistic is the same as chisq

## Not run: 
##D # User-defined test statistic:
##D my.fun <- function(Y){
##D summary(lm(Y~X))$coeff[2,"Estimate"]
##D }
##D X <- matrix(rep(0:2,5))
##D Y <- matrix(rnorm(mean=X,n=15))
##D res=flip(Y=Y,X=X,statTest=my.fun,tail=0)
##D res
##D hist(res)
## End(Not run)



