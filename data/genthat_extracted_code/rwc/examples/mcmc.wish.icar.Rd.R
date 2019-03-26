library(rwc)


### Name: mcmc.wish.icar
### Title: Markov chain Monte Carlo sampler for Generalized Wishart
###   distance matrix data arising from an ICAR spatial model.
### Aliases: mcmc.wish.icar
### Keywords: ~kwd1 ~kwd2

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
##D ##
##D ## fitting using MCMC
##D ## 
##D 
##D fit=mcmc.wish.icar(D.rand.ibr,TL,samp.locs,df=20,output.trace.plot=TRUE,
##D                    adapt.int=100,adapt.max=100000,n.mcmc=10000)
##D 
##D str(fit)
##D 
## End(Not run)



