library(SAMM)


### Name: SAMM
### Title: Some Algoritms for Mixed Models
### Aliases: SAMM

### ** Examples

## Not run: 
##D library(SAMM)
##D #set.seed(12345)
##D 
##D n=120
##D ntrain=100
##D M1<-matrix(rbinom(n*180,2,.3)-1, nrow=n)
##D K<-relmatcov_cppforR(c(0), M1)
##D K[1:5,1:5]
##D det(K)
##D K=K+1e-3*diag(n)
##D mean(diag(K))
##D 
##D covY<-2*K+1*diag(n)
##D 
##D Y<-10+crossprod(chol(covY),rnorm(n))
##D 
##D 
##D #training set
##D Trainset<-sample(1:n,ntrain,replace=(ntrain>n))
##D y=Y[Trainset]
##D X=matrix(rep(1, n)[Trainset], ncol=1)
##D Z=diag(n)[Trainset,]
##D 
##D X=X
##D y=y
##D 
##D 
##D 
##D ########1
##D samout1<-SAMM(Y=matrix(y,ncol=1),X=X, Zlist=list(Z), Klist=list(K),
##D lambda=0, W=diag(ntrain),R=list(diag(ntrain)),Siglist=list(),
##D corfunc=c(F,F), corfuncfixed=c(F,F), sigfunc=c(F),mmalg="emm_ml",
##D tolparconv=1e-10, tolparinv=1e-10,maxiter=1000,geterrors=F)
##D 
##D samout2<-SAMM(Y=matrix(y,ncol=1),X=X, Zlist=list(Z), Klist=list(K),
##D lambda=0, W=diag(ntrain),R=list(diag(ntrain)),Siglist=list(),
##D corfunc=c(F,F), corfuncfixed=c(F,F), sigfunc=c(F),mmalg="emm_reml",
##D tolparconv=1e-10, tolparinv=1e-10,maxiter=1000,geterrors=F)
##D 
##D samout3<-SAMM(Y=matrix(y,ncol=1),X=X, Zlist=list(Z),
##D Klist=list(list("Const",c(0),K)), lambda=0, 
##D W=diag(ntrain),R=list(diag(ntrain)),Siglist=list(),
##D corfunc=c(F,F), corfuncfixed=c(F,F), sigfunc=c(F),
##D mmalg="dmm_ml", tolparconv=1e-10, tolparinv=1e-10,
##D maxiter=1000,geterrors=F)
##D 
##D samout4<-SAMM(Y=matrix(y,ncol=1),X=X, Zlist=list(Z), 
##D Klist=list(list("Const",c(0),K)), lambda=0, 
##D W=diag(ntrain),R=list(diag(ntrain)),Siglist=list(), 
##D corfunc=c(F,F), corfuncfixed=c(F,F), sigfunc=c(F),
##D mmalg="dmm_reml", tolparconv=1e-10, tolparinv=1e-10,
##D maxiter=1000,geterrors=F)
##D 
##D samout5<-SAMM(Y=matrix(y,ncol=1),X=X, Zlist=list(Z),
##D Klist=list(K), lambda=0, W=diag(ntrain),
##D R=list(diag(ntrain)),Siglist=list(), corfunc=c(F,F), 
##D corfuncfixed=c(F,F), sigfunc=c(F),mmalg="mm_ml", 
##D tolparconv=1e-10, tolparinv=1e-10,maxiter=1000,geterrors=F)
##D 
##D samout6<-SAMM(Y=matrix(y,ncol=1),X=X, Zlist=list(Z), 
##D Klist=list(K), lambda=0, W=diag(ntrain),R=list(diag(ntrain)),
##D Siglist=list(), corfunc=c(F,F), corfuncfixed=c(F,F), 
##D sigfunc=c(F),mmalg="dermm_reml1", tolparconv=1e-10, 
##D tolparinv=1e-10,maxiter=1000,geterrors=F)
##D 
##D samout7<-SAMM(Y=matrix(y,ncol=1),X=X, Zlist=list(Z),
##D Klist=list(K), lambda=0, W=diag(ntrain),R=list(diag(ntrain)),
##D Siglist=list(), corfunc=c(F,F), corfuncfixed=c(F,F), 
##D sigfunc=c(F),mmalg="dermm_reml2", tolparconv=1e-10, 
##D tolparinv=1e-10,maxiter=1000,geterrors=F)
##D 
##D samout8<-SAMM(Y=matrix(y,ncol=1),X=X, Zlist=list(Z),
##D Klist=list(K), lambda=0, W=diag(ntrain),R=list(diag(ntrain)),
##D Siglist=list(), corfunc=c(F,F), corfuncfixed=c(F,F), 
##D sigfunc=c(F),mmalg="mmmk_ml", tolparconv=1e-10, 
##D tolparinv=1e-10,maxiter=1000,geterrors=F)
##D 
##D samout9<-SAMM(Y=matrix(y,ncol=1),X=X, Zlist=list(Z), 
##D Klist=list(K), lambda=0, W=diag(ntrain),R=list(diag(ntrain)),
##D Siglist=list(), corfunc=c(F,F), corfuncfixed=c(F,F), 
##D sigfunc=c(F),mmalg="emmmk_reml", tolparconv=1e-10, 
##D tolparinv=1e-10,maxiter=1000,geterrors=F)
##D 
##D samout10<-SAMM(Y=matrix(y,ncol=1),X=X, Zlist=list(Z), 
##D Klist=list(K), lambda=0, W=diag(ntrain),R=list(diag(ntrain)),
##D Siglist=list(), corfunc=c(F,F), corfuncfixed=c(F,F), 
##D sigfunc=c(F),mmalg="emmmk_ml", tolparconv=1e-10, 
##D tolparinv=1e-10,maxiter=1000,geterrors=F)
##D 
##D samout11<-SAMM(Y=matrix(y,ncol=1),X=X, Zlist=list(Z),
##D Klist=list(K), lambda=0, W=diag(ntrain),R=list(diag(ntrain)),
##D Siglist=list(), corfunc=c(F,F), corfuncfixed=c(F,F), sigfunc=c(F),
##D mmalg="emmmv_ml", tolparconv=1e-10, tolparinv=1e-10,maxiter=1000,geterrors=F)
##D 
##D ###########2
##D R<-diag(ntrain)
##D diag(R)<-diag(R)+.01*rnorm(nrow(R))
##D 
##D samout12<-SAMM(Y=matrix(y,ncol=1),X=X, Zlist=list(Z),
##D Klist=list(K), lambda=0, W=diag(ntrain),R=list(R),
##D Siglist=list(), corfunc=c(F,F), corfuncfixed=c(F,F),
##D sigfunc=c(F),mmalg="mmmk_ml", tolparconv=1e-10, 
##D tolparinv=1e-10,maxiter=1000,geterrors=F)
##D 
##D samout13<-SAMM(Y=matrix(y,ncol=1),X=X, Zlist=list(Z), 
##D Klist=list(K), lambda=0, W=diag(ntrain),R=list(R),
##D Siglist=list(), corfunc=c(F,F), corfuncfixed=c(F,F), 
##D sigfunc=c(F),mmalg="mm_ml", tolparconv=1e-10, 
##D tolparinv=1e-10,maxiter=1000,geterrors=F)
##D 
##D samout14<-SAMM(Y=matrix(y,ncol=1),X=X, Zlist=list(Z),
##D Klist=list(K), lambda=0, W=diag(ntrain),R=list(R),
##D Siglist=list(), corfunc=c(F,F), corfuncfixed=c(F,F), 
##D sigfunc=c(F),mmalg="mmmv_ml", tolparconv=1e-10, 
##D tolparinv=1e-10,maxiter=1000,geterrors=F)
##D 
##D samout15<-SAMM(Y=matrix(y,ncol=1),X=X, Zlist=list(Z), 
##D Klist=list(K), lambda=0, W=diag(ntrain),R=list(R),
##D Siglist=list(), corfunc=c(F,F), corfuncfixed=c(F,F), 
##D sigfunc=c(F),mmalg="mmmkmv_ml", tolparconv=1e-10, 
##D tolparinv=1e-10,maxiter=1000,geterrors=F)
##D 
##D samout16<-SAMM(Y=matrix(y,ncol=1),X=X, Zlist=list(Z), 
##D Klist=list(K), lambda=0, W=diag(ntrain),R=list(R),Siglist=list(),
##D corfunc=c(F,F), corfuncfixed=c(F,F), sigfunc=c(F),
##D mmalg="dermm_reml1", tolparconv=1e-10,
##D tolparinv=1e-10,maxiter=1000,geterrors=F)
##D 
##D samout17<-SAMM(Y=matrix(y,ncol=1),X=X, Zlist=list(Z), 
##D Klist=list(K), lambda=0, W=diag(ntrain),R=list(R),
##D Siglist=list(), corfunc=c(F,F), corfuncfixed=c(F,F),
##D sigfunc=c(F),mmalg="dermm_reml2", tolparconv=1e-10, 
##D tolparinv=1e-10,maxiter=1000,geterrors=F)
##D 
##D samout18<-SAMM(Y=matrix(y,ncol=1),X=X, Zlist=list(Z),
##D Klist=list(list("Const",c(0),K)), lambda=0, W=diag(ntrain),
##D R=list(R),Siglist=list(), corfunc=c(F,F), 
##D corfuncfixed=c(F,F), sigfunc=c(F),mmalg="dmm_ml",
##D tolparconv=1e-10, tolparinv=1e-10,maxiter=1000,geterrors=F)
##D 
##D samout19<-SAMM(Y=matrix(y,ncol=1),X=X, Zlist=list(Z), 
##D Klist=list(list("Const",c(0),K)), lambda=0, W=diag(ntrain),
##D R=list(R),Siglist=list(), corfunc=c(F,F), corfuncfixed=c(F,F), 
##D sigfunc=c(F),mmalg="dmm_reml", tolparconv=1e-10,
##D tolparinv=1e-10,maxiter=1000,geterrors=F)
##D 
##D 
##D 
##D 
##D ##3
##D samout20<-SAMM(Y=matrix(y,ncol=1),X=X, Zlist=list(Z), 
##D Klist=list(list("Const",c(0),K)), lambda=0, W=diag(ntrain),
##D R=list(R),Siglist=list(), corfunc=c(T,F), corfuncfixed=c(F,F),
##D sigfunc=c(F),mmalg="dmm_reml", tolparconv=1e-10, 
##D tolparinv=1e-10,maxiter=1000,geterrors=F)
##D 
##D samout21<-SAMM(Y=matrix(y,ncol=1),X=X, Zlist=list(Z),
##D Klist=list(list("ar1",c(0),matrix(n,1,1))), lambda=0, 
##D W=diag(ntrain),R=list(R),Siglist=list(), corfunc=c(T,F),
##D corfuncfixed=c(F,F), sigfunc=c(F),mmalg="dmm_reml",
##D tolparconv=1e-10, tolparinv=1e-10,maxiter=1000,geterrors=F)
##D 
##D 
##D samout22<-SAMM(Y=matrix(y,ncol=1),X=X, Zlist=list(Z),
##D Klist=list(list("ar1het",rep(0,n),matrix(n,1,1))), lambda=0,
##D W=diag(ntrain),R=list(R),Siglist=list(), corfunc=c(T,F),
##D corfuncfixed=c(F,F), sigfunc=c(F),mmalg="dmm_reml",
##D tolparconv=1e-10, tolparinv=1e-10,maxiter=1000,geterrors=F)
##D 
##D samout1$Vu
##D samout2$Vu
##D samout3$Vu
##D samout4$Vu
##D samout5$Vu
##D samout6$Vu
##D samout7$Vu
##D samout8$Vu
##D samout9$Vu
##D samout10$Vu
##D samout11$Vu
##D 
##D samout12$Vu
##D samout13$Vu
##D samout14$sigmahatlist[[1]]
##D samout15$sigmahatlist[[1]]
##D samout16$Vu
##D samout17$Vu
##D samout18$Vu
##D samout19$Vu
##D 
##D samout20$Ve
##D str(samout19)
##D 
##D 
##D str(samout20)
##D str(samout21)
##D str(samout22)
##D 
##D 
##D 
##D 
##D ###
##D 
##D samout1$Vu
##D samout2$Vu
##D samout3$Vu
##D samout4$Vu
##D samout5$Vu
##D samout6$Vu
##D samout7$Vu
##D samout8$Vu
##D samout9$Vu
##D samout10$Vu
##D samout11$Vgt
##D 
##D samout12$Vu
##D samout13$Vu
##D samout14$sigmahatlist[[1]]
##D samout15$sigmahatlist[[1]]
##D samout16$Vu
##D samout17$Vu
##D samout18$Vu
##D samout19$Vu
##D 
##D samout20$Ve
##D str(samout19)
##D 
##D 
##D str(samout20)
##D str(samout21)
##D str(samout22)
##D 
##D 
##D 
##D ###############################
##D 
##D 
##D n=100
##D nsample=80
##D rhotrans=5
##D rho=tan((pi/2)*print((2/pi)*atan(rhotrans)))
##D rho
##D M1<-matrix(rbinom(n*300, 2, .2)-1, nrow=n)
##D K1<-relmatcov_cppforR(c(.01), M1)
##D 
##D M2<-matrix(rbinom(n*300, 2, .2)-1, nrow=n)
##D K2<-relmatcov_cppforR(c(-0.3), M2)
##D ##K2<-ar1_cppforR(c(20), matrix(n))
##D W=(diag(5)[sample(1:5,n, replace=T),])
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
##D 
##D 
##D samout27<-SAMM(Y=matrix(ytrain,ncol=1),X=Xtrain,
##D Zlist=list(Ztrain, Ztrain), Klist=list(K1,K2), 
##D lambda=0, W=Wtrain,R=list(list("ar1",c(0),matrix(5,1,1))),
##D Siglist=list("","",""), corfunc=c(F,F,T), 
##D corfuncfixed=c(F,F,F), sigfunc=c(F,F,F),mmalg="mmmk_ml",
##D tolparconv=1e-10, tolparinv=1e-10,maxiter=1000,geterrors=F)
##D str(samout27)
##D 
##D 
##D samout29<-SAMM(Y=matrix(ytrain,ncol=1),X=Xtrain,
##D Zlist=list(Ztrain, Ztrain), Klist=list(K1,K2),
##D lambda=0, W=Wtrain,R=list("ar1",c(0),matrix(5,1,1)),
##D Siglist=list("","",""), corfunc=c(F,F,T),
##D corfuncfixed=c(F,F,F), sigfunc=c(F,F,F),
##D mmalg="dermm_reml1", tolparconv=1e-10,
##D tolparinv=1e-10,maxiter=1000,geterrors=F)
##D 
##D str(samout29)
##D 
##D samout30<-SAMM(Y=matrix(ytrain,ncol=1),X=Xtrain,
##D Zlist=list(Ztrain, Ztrain), Klist=list(K1,K2),
##D lambda=0, W=Wtrain,R=list("ar1",c(0),matrix(5,1,1)),
##D Siglist=list("","",""), corfunc=c(F,F,T), corfuncfixed=c(F,F,F),
##D sigfunc=c(F,F,F),mmalg="dermm_reml2", tolparconv=1e-10,
##D tolparinv=1e-10,maxiter=1000,geterrors=F)
##D str(samout30)
##D 
##D 
##D ###########################
##D 
##D n=100
##D M1<-matrix(rbinom(n*150, 2, .2)-1, nrow=n)
##D K1<-relmatcov_cppforR(c(0), M1)
##D M2<-matrix(rbinom(n*150, 2, .2)-1, nrow=n)
##D K2<-relmatcov_cppforR(c(0), M2)
##D M3<-matrix(rbinom(n*100, 2, .2)-1, nrow=n)
##D K3<-relmatcov_cppforR(c(0), M3)
##D M4<-matrix(rbinom(n*100, 2, .2)-1, nrow=n)
##D K4<-relmatcov_cppforR(c(0), M4)
##D 
##D 
##D covY<-2*K1+3*K2+1*K3+2*K4+3*diag(n)
##D 
##D Y<-10+crossprod(chol(covY),rnorm(n))
##D 
##D 
##D #training set
##D Trainset<-sample(1:n,80)
##D y=Y[Trainset]
##D X=matrix(rep(1, n)[Trainset], ncol=1)
##D Z=diag(n)[Trainset,]
##D 
##D X=X
##D y=y
##D 
##D samout35<-SAMM(Y=matrix(y,ncol=1),X=X,Zlist=list(Z,Z,Z,Z),
##D lambda=0,Klist=list(K1,K2,K3,K4), W=Z,R=list(diag(n)),
##D Siglist=list("","","","",""), corfunc=c(F,F,F,F,F), 
##D corfuncfixed=c(T,T,T,T,T),sigfunc=c(F,F,F,F,F),
##D mmalg="mmmk_ml", tolparconv=1e-10,
##D tolparinv=1e-10,maxiter=1000,geterrors=F)
##D str(samout35)
##D 
##D samout36<-SAMM(Y=matrix(y,ncol=1),X=X,Zlist=list(Z,Z,Z,Z),
##D lambda=0.99999,Klist=list(K1,K2,K3,K4), W=Z,
##D R=list(diag(n)),Siglist=list("","","","",""),
##D corfunc=c(F,F,F,F,F), corfuncfixed=c(T,T,T,T,T),
##D sigfunc=c(F,F,F,F,F),mmalg="mmmk_ml", tolparconv=1e-10,
##D tolparinv=1e-10,maxiter=1000,geterrors=F)
##D str(samout36)
##D 
##D 
##D outmat<-c()
##D for (lambda in seq(0,.999999, length=30)){
##D   
##D   
##D   samout37<-SAMM(Y=matrix(y,ncol=1),X=X,
##D   Zlist=list(Z,Z,Z,Z),lambda=lambda,Klist=list(K1,K2,K3,K4),
##D   W=Z,R=list(diag(n)),Siglist=list("","","","",""),
##D   corfunc=c(F,F,F,F,F), corfuncfixed=c(T,T,T,T,T), 
##D   sigfunc=c(F,F,F,F,F),mmalg="mmmk_ml",
##D   tolparconv=1e-10, tolparinv=1e-10,
##D   maxiter=1000,geterrors=F)
##D   
##D   
##D   outmat<-cbind(outmat,c(samout37$Vu*samout37$weights, samout37$Ve))
##D   
##D }
##D str(samout37)
##D colnames(outmat)<-seq(0,.999999, length=30)
##D 
##D maxmat<-max(c(outmat))
##D minmat<-min(c(outmat))
##D 
##D plot(seq(0,.999999, length=30),outmat[1,],
##D ylim=c(minmat-1, maxmat+1), col=2, type="l")
##D for (i in 2:5){
##D   par(new=T)
##D   plot(seq(0,.999999, length=30), outmat[i,],
##D   axes=F, ylim=c(minmat-1, maxmat+1), col=i+1, type="l", xlab="", ylab="")
##D }
##D 
## End(Not run) 



