library(SAMM)


### Name: sigcovfuncs_cppforR
### Title: Covariance and Sigma Functions
### Aliases: FA1hetSig_cppforR FA1homSig_cppforR FAhetSig_cppforR
###   FAhomSig_cppforR UnstrKronIdentSig_cppforR IdentKronUnstrSig_cppforR
###   IdentSig_cppforR ar1hetcov_cppforR arma11cov_cppforR
###   compsymmcov_cppforR compsymmhetSig_cppforR compsymmhetcov_cppforR
###   compsymmhomSig_cppforR diagSig_cppforR diagcov_cppforR expcov_cppforR
###   lincombcov_cppforR rbfcov_cppforR ar1cov_cppforR
###   unstrKronKcov_cppforR relmatcov_cppforR UnstrKronUnstrcov_cppforR
###   unstrcov_cppforR ConstMatcov_cppforR KKronar1cov_cppforR
###   KKronar1hetcov_cppforR KKronarma11cov_cppforR
###   KKroncompsymmcov_cppforR KKroncompsymmhetcov_cppforR
###   KKrondiagcov_cppforR KKronunstrcov_cppforR ar1KronKcov_cppforR
###   ar1hetKronKcov_cppforR arma11KronKcov_cppforR
###   compsymmKronKcov_cppforR compsymmhetKronKcov_cppforR
###   diagKronKcov_cppforR expdistcov_cppforR rbfdistcov_cppforR
###   splincov_cppforR splinlogcov_cppforR sppowcov_cppforR

### ** Examples

## Not run: 
##D library(SAMM)
##D n=100
##D nsample=80
##D rhotrans=5
##D ar1cov_cppforR(c(rhotrans),matrix(5))
##D rho=(2/pi)*atan(rhotrans)
##D rho
##D tan((pi/2)*(rho))
##D 
##D M1<-matrix(rbinom(n*300, 2, .2)-1, nrow=n)
##D K1<-relmatcov_cppforR(c(.01), M1)
##D 
##D M2<-matrix(rbinom(n*300, 2, .2)-1, nrow=n)
##D K2<-relmatcov_cppforR(c(0.03), M2)
##D W=(diag(5)[sample(1:5,n, replace=TRUE),])
##D covY<-3*K1+5*K2+10*(W%*%ar1cov_cppforR(c(rhotrans),matrix(5))%*%t(W))
##D K1[1:5,1:5]
##D dim(W)
##D dim(ar1cov_cppforR(c(6),matrix(5)))
##D Y<-10+crossprod(chol(covY),rnorm(n))
##D 
##D 
##D #training set
##D Trainset<-sample(1:n,nsample)
##D ytrain=Y[Trainset]
##D Xtrain=matrix(rep(1, n)[Trainset], ncol=1)
##D Ztrain=diag(n)[Trainset,]
##D Wtrain=W[Trainset,]
##D 
##D samout<-SAMM(Y=matrix(ytrain,ncol=1),X=Xtrain,
##D Zlist=list(Ztrain, Ztrain), Klist=list(K1,K2),
##D lambda=0, W=Wtrain,R=list("ar1",c(0),matrix(5,1,1)),
##D Siglist=list("","",""), corfunc=c(F,F,T), corfuncfixed=c(F,F,F),
##D sigfunc=c(F,F,F),mmalg="dermm_reml2", tolparconv=1e-10,
##D tolparinv=1e-10,maxiter=1000,geterrors=F)
##D samout$corfuncparamslist[[3]]
##D rhohat=(2/pi)*atan(samout$corfuncparamslist[[3]])
##D rhohat
##D ar1cov_cppforR(c(samout$corfuncparamslist[[3]]),matrix(5,1,1))
## End(Not run)



