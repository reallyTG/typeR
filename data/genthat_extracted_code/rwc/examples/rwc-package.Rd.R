library(rwc)


### Name: rwc-package
### Title: Random Walk Covariance Models
### Aliases: rwc-package rwc

### ** Examples


## Not run: 
##D ## The following code conducts a simulation example by
##D ## first simulating a heterogeneous landscape, then
##D ## simulating pairwise distance data on the landscape
##D ## and finally making inference on model parameters.
##D 
##D library(rwc)
##D library(MASS)
##D 
##D ## source("GenWishFunctions_20170901.r")
##D 
##D ##
##D ## specify 2-d raster
##D ##
##D 
##D 
##D ras=raster(nrow=30,ncol=30)
##D extent(ras) <- c(0,30,0,30)
##D values(ras) <- 1
##D plot(ras,asp=1)
##D ras
##D 
##D int=ras
##D cov.ras=ras
##D 
##D 
##D 
##D ## simulate "resistance" raster
##D TL.int=get.TL(int)
##D Q.int=get.Q(TL.int,1)
##D set.seed(1248)
##D ## values(cov.ras) <- as.numeric(rnorm.Q(Q.int##D 
##D values(cov.ras) <- as.numeric(rnorm.Q(Q.int,zero.constraint=TRUE))
##D plot(cov.ras)
##D 
##D 
##D stack=stack(int,cov.ras)
##D plot(stack)
##D TL=get.TL(stack)
##D 
##D 
##D ## Create "barrier" raster which has no effect, to test model selection
##D 
##D barrier=int
##D values(barrier) <- 0
##D barrier[,10:11] <- 1
##D 
##D plot(barrier)
##D 
##D TL.all=get.TL(stack(int,cov.ras,barrier))
##D 
##D 
##D ##
##D ## sampling locations
##D ##
##D 
##D nsamps=150
##D set.seed(4567)
##D samp.xy=cbind(runif(nsamps,0,30),runif(nsamps,0,30))
##D ## samp.xy=samp.xy[rep(1:nsamps,times=5),]
##D samp.locs=cellFromXY(int,samp.xy)
##D samp.cells=unique(samp.locs)
##D nsamps=nrow(samp.xy)
##D 
##D plot(cov.ras)
##D points(samp.xy)
##D 
##D K=matrix(0,nrow=nsamps,ncol=length(samp.cells))
##D for(i in 1:nsamps){
##D     K[i,which(samp.cells==samp.locs[i])]=1
##D }
##D image(K)
##D 
##D ##
##D ## beta values
##D ##
##D 
##D 
##D betas=c(-2,-1)
##D tau=.01
##D 
##D 
##D Q=get.Q(TL,betas)
##D Phi=get.Phi(Q,samp.cells)
##D 
##D 
##D 
##D ## simulate from ibr model
##D D.rand.ibr=rGenWish(df=20,Sigma=K%*%ginv(as.matrix(Phi))%*%t(K) + diag(nsamps)*tau)
##D image(D.rand.ibr)
##D 
##D 
##D ## crude plot of geographic distance vs genetic distance
##D 
##D plot(as.numeric(as.matrix(dist(xyFromCell(ras,samp.locs)))),as.numeric(D.rand.ibr))
##D 
##D ###################################
##D ##
##D ##
##D ## fitting using optim
##D ## 
##D ##
##D 
##D 
##D nll.gen.wish.icar <- function(theta,D,df,TL,obs.idx){
##D     ## get K
##D     cells.idx=unique(obs.idx)
##D     n.cells=length(cells.idx)
##D     n.obs=length(obs.idx)
##D     K <- matrix(0, nrow = n.obs, ncol = n.cells)
##D     for (i in 1:n.obs){
##D         K[i, which(cells.idx == obs.idx[i])] <- 1
##D     }
##D     ## get precision matrix of whole graph
##D     tau=exp(theta[1])
##D     beta=theta[-1]
##D     Q=get.Q(TL,beta)
##D     ## get precision matrix of observed nodes
##D     max.diag=max(diag(Q))
##D     Q=Q/max.diag
##D     Phi=get.Phi(Q,cells.idx)
##D     ## get covariance matrix of observations
##D     Sigma.nodes=ginv(as.matrix(Phi))
##D     Sigma.nodes=Sigma.nodes/max.diag
##D     Psi=K%*%Sigma.nodes%*%t(K)+tau*diag(nrow(K))
##D     ## get nll
##D     nll=-dGenWish(D,Psi,df,log=TRUE)
##D     nll
##D }
##D 
##D 
##D fit=optim(c(log(tau),betas),nll.gen.wish.icar,D=D.rand.ibr,df=20,TL=TL,
##D     obs.idx=samp.locs,control=list(trace=10),hessian=TRUE)
##D 
##D fit.all=optim(c(log(tau),betas,0),nll.gen.wish.icar,D=D.rand.ibr,df=20,TL=TL.all,
##D     obs.idx=samp.locs,control=list(trace=10),hessian=FALSE)
##D 
##D fit.ibd=optim(c(log(tau),0),nll.gen.wish.icar,D=D.rand.ibr,df=20,TL=TL.int,
##D     obs.idx=samp.locs,control=list(trace=10),hessian=FALSE)
##D 
##D 
##D ## model selection using AIC
##D 
##D aic.ibr=2*fit$value + 2*length(fit$par)
##D aic.all=2*fit.all$value + 2*length(fit.all$par)
##D aic.ibd=2*fit.ibd$value + 2*length(fit.ibd$par)
##D 
##D aic.ibr
##D aic.all
##D aic.ibd
##D 
##D ## se's for best fit
##D 
##D str(fit)
##D ## get standard errors from optim
##D H=fit$hessian
##D S=solve(H)
##D se=sqrt(diag(S))
##D se
##D 
##D ## CI's for best fit
##D 
##D CImat=matrix(NA,3,4)
##D rownames(CImat) <- c("log(tau)","intercept","resistance")
##D colnames(CImat) <- c("truth","estimate","lower95CI","upper95CI")
##D CImat[,1]=c(log(tau),betas)
##D CImat[,2]=fit$par
##D CImat[,3]=fit$par-1.96*se
##D CImat[,4]=fit$par+1.96*se
##D 
##D CImat
## End(Not run)



