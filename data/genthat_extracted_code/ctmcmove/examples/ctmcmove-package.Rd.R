library(ctmcmove)


### Name: ctmcmove-package
### Title: ctmcmove
### Aliases: ctmcmove-package ctmcmove
### Keywords: Animal Movement

### ** Examples

## Not run: 
##D 
##D ##
##D ## Example of using a CTMC model for movement
##D ##
##D ## Steps:
##D ##  1. Fit Quasi-Continuous Path Model to telemetry data (done using Buderman et al 2015)
##D ##  2. Create covariate raster objects (the CTMC will be on the raster
##D ##     grid cells)
##D ##  3. Impute a quasi-continuous path
##D ##  4. Turn quasi-continuous path into a CTMC discrete-space path
##D ##  5. Turn discrete-space path into latent Poisson GLM format
##D ##  6. Fit a Poisson GLM model to the data
##D ##
##D 
##D library(ctmcmove)
##D data(seal)
##D xyt=seal$locs[,3:1]
##D head(xyt)
##D plot(xyt[,1:2],type="b")
##D xy=xyt[,-3]
##D x=xyt[,1]
##D y=xyt[,2]
##D t=xyt[,3]
##D 
##D 
##D ########################
##D 
##D 
##D ##########################################################################
##D ##
##D ## 1. Fit functional movement model to telemetry data
##D ##
##D ##########################################################################
##D 
##D library(fda)
##D 
##D ## Define the knots of the spline expansion.
##D ##
##D ## Problems with fitting the functional movement model can often be fixed by
##D ## varying the spacing of the knots.
##D knots = seq(min(t),max(t),by=1/4)
##D ## create B-spline basis vectors used to approximate the path
##D b=create.bspline.basis(c(min(t),max(t)),breaks=knots,norder=3)
##D ## define the sequence of times on which to sample the imputed path
##D tpred=seq(min(t),max(t),by=1/24/60)
##D 
##D 
##D 
##D ## Fit latent Gaussian model using MCMC
##D out=mcmc.fmove(xy,t,b,tpred,QQ="CAR",n.mcmc=400,a=1,r=1,num.paths.save=30)
##D str(out)
##D 
##D ## plot 3 imputed paths
##D plot(xy,type="b")
##D points(out$pathlist[[1]]$xy,col="red",type="l")
##D points(out$pathlist[[2]]$xy,col="blue",type="l")
##D points(out$pathlist[[3]]$xy,col="green",type="l")
##D 
##D 
##D ##########################################################################
##D ##
##D ## 2. Creating rasters
##D ##
##D ##########################################################################
##D 
##D cov.df=seal$cov.df
##D str(cov.df)
##D 
##D NN=sqrt(nrow(cov.df$X))
##D sst=matrix(seal$cov.df$X$sst,NN,byrow=TRUE)
##D sst=sst[NN:1,]
##D sst=raster(sst,xmn=min(seal$cov.df$X$x),xmx=max(seal$cov.df$X$x),
##D            ymn=min(seal$cov.df$X$y),ymx=max(seal$cov.df$X$y))
##D 
##D 
##D crs(sst)="+proj=longlat +datum=WGS84"
##D plot(sst)
##D 
##D chA=matrix(seal$cov.df$X$chA,NN,byrow=TRUE)
##D chA=chA[NN:1,]
##D chA=raster(chA,xmn=min(seal$cov.df$X$x),xmx=max(seal$cov.df$X$x),
##D            ymn=min(seal$cov.df$X$y),ymx=max(seal$cov.df$X$y))
##D crs(chA)="+proj=longlat +datum=WGS84"
##D 
##D pro=matrix(seal$cov.df$X$pro,NN,byrow=TRUE)
##D pro=pro[NN:1,]
##D npp=raster(pro,xmn=min(seal$cov.df$X$x),xmx=max(seal$cov.df$X$x),
##D            ymn=min(seal$cov.df$X$y),ymx=max(seal$cov.df$X$y))
##D crs(npp)="+proj=longlat +datum=WGS84"
##D 
##D 
##D int=sst
##D values(int) <- 1
##D 
##D d2r=int
##D rookery.cell=cellFromXY(int,xyt[1,1:2])
##D values(d2r)=NA
##D values(d2r)[rookery.cell]=0
##D d2r=distance(d2r)
##D 
##D grad.stack=stack(sst,chA,npp,d2r)
##D names(grad.stack) <- c("sst","cha","npp","d2r")
##D 
##D plot(sst)
##D points(xyt[,1:2],type="b")
##D 
##D plot(grad.stack)
##D 
##D 
##D ##########################################################################
##D ##
##D ## 3 Impute Quasi-Continuous Paths
##D ##
##D ##########################################################################
##D 
##D P=20
##D 
##D plot(sst,col=grey.colors(100))
##D for(i in 1:P){
##D     points(out$pathlist[[i]]$xy,col=i,type="l",lwd=2)
##D }
##D points(xyt[,1:2],type="b",pch=20,cex=2,lwd=2)
##D 
##D ##########################################################################
##D ##
##D ## 4. Turn continuous space path into a CTMC discrete space path
##D ##
##D ##########################################################################
##D 
##D path=out$pathlist[[1]]
##D ctmc=path2ctmc(path$xy,path$t,int,method="LinearInterp")
##D ## alternate method, useful if you have impassible barriers, but slower
##D ## ctmc=path2ctmc(path$xy,path$t,int,method="ShortestPath")
##D 
##D str(ctmc)
##D 
##D ##########################################################################
##D ##
##D ## 5. Turn CTMC discrete path into latent Poisson GLM data
##D ##
##D ##########################################################################
##D 
##D 
##D loc.stack=stack(int,sst)
##D names(loc.stack) <- c("Intercept","sst.loc")
##D 
##D glm.list=list()
##D glm.list[[1]]=ctmc2glm(ctmc,loc.stack,grad.stack)
##D 
##D str(glm.list)
##D 
##D for(i in 2:P){
##D     cat(i," ")
##D     path=out$pathlist[[i]]
##D     ctmc=path2ctmc(path$xy,path$t,int,method="LinearInterp")
##D     glm.list[[i]]=ctmc2glm(ctmc,loc.stack,grad.stack)
##D }
##D 
##D ## remove transitions that are nearly instantaneous
##D ##  (These are essentially outliers in the following regression analyses)
##D for(i in 1:P){
##D     idx.0=which(glm.list[[i]]$tau<10^-5)
##D     if(length(idx.0)>0){
##D         glm.list[[i]]=glm.list[[i]][-idx.0,]
##D     }
##D     glm.list[[i]]$t=glm.list[[i]]$t-min(glm.list[[i]]$t)
##D }
##D 
##D 
##D ##
##D ## Stack the P imputations together
##D ##
##D 
##D glm.data=glm.list[[1]]
##D for(i in 2:P){
##D     glm.data=rbind(glm.data,glm.list[[i]])
##D }
##D 
##D str(glm.data)
##D 
##D ##########################################################################
##D ##
##D ## 6. Fit Poisson GLM
##D ##    (here we are fitting all "M" paths simultaneously,
##D ##     giving each one a weight of "1/M")
##D ##
##D ##########################################################################
##D 
##D fit.SWL=glm(z~cha+npp+sst+crw+d2r+sst.loc,
##D         weights=rep(1/P,nrow(glm.data)),family="poisson",offset=log(tau),data=glm.data)
##D summary(fit.SWL)
##D 
##D beta.hat.SWL=coef(fit.SWL)
##D beta.se.SWL=summary(fit.SWL)$coef[,2]
##D 
##D ##########################################################################
##D ##
##D ## 6. Fit Poisson GLM
##D ##    (here we are fitting using Multiple Imputation
##D ##
##D ##########################################################################
##D 
##D ## Fit each path individually
##D glm.fits=list()
##D for(i in 1:P){
##D     glm.fits[[i]]=glm(z~cha+npp+sst+crw+d2r+sst.loc,
##D         family="poisson",offset=log(tau),data=glm.list[[i]])
##D }
##D 
##D ## get point estimates and sd estimates using Rubin's MI combining rules
##D beta.hat.mat=integer()
##D beta.se.mat=integer()
##D for(i in 1:P){
##D     beta.hat.mat=rbind(beta.hat.mat,coef(glm.fits[[i]]))
##D     beta.se.mat=rbind(beta.se.mat,summary(glm.fits[[i]])$coef[,2])
##D }
##D 
##D beta.hat.mat
##D beta.se.mat
##D 
##D ## E(beta) = E_paths(E(beta|path))
##D beta.hat.MI=apply(beta.hat.mat,2,mean)
##D beta.hat.MI
##D 
##D ## Var(beta) = E_paths(Var(beta|path))+Var_paths(E(beta|path))
##D beta.var.MI=apply(beta.se.mat^2,2,mean)+apply(beta.hat.mat,2,var)
##D beta.se.MI=sqrt(beta.var.MI)
##D 
##D cbind(beta.hat.MI,beta.se.MI)
##D 
##D ##
##D ## compare estimates from MI and Stacked Weighted Likelihood approach
##D ##
##D 
##D ## standardize regression coefficients by multiplying by the SE of the X matrix
##D sds=apply(model.matrix(fit.SWL),2,sd)
##D sds[1]=1
##D 
##D ## plot MI and SWL regression coefficients
##D par(mfrow=c(1,2))
##D plot(beta.hat.MI*sds,beta.hat.SWL*sds,main="(a) Coefficient Estimates",
##D xlab="Weighted Likelihood Coefficient",
##D ylab="Multiple Imputation Coefficient",pch=20,cex=2)
##D abline(0,1,col="red")
##D plot(log(beta.se.MI),log(beta.se.SWL),
##D main="(b) Estimated log(Standard Errors)",xlab="Weighted Likelihood log(SE)",
##D  ylab="Multiple Imputation log(SE)",pch=20,cex=2)
##D abline(0,1,col="red")
##D 
##D 
##D ###########################################################################
##D ##
##D ## 6. (Alternate) We can use any software which fits Poisson glm data.
##D ##    The following uses "gam" in package "mgcv" to fit a time-varying
##D ##    effect of "d2r" using penalized regression splines.  The result
##D ##    is similar to that found in:
##D ##
##D ##    Hanks, E.; Hooten, M.; Johnson, D. & Sterling, J. Velocity-Based
##D ##    Movement Modeling for Individual and Population Level Inference
##D ##    PLoS ONE, Public Library of Science, 2011, 6, e22795
##D ##
##D ###########################################################################
##D 
##D library(mgcv)
##D 
##D fit=gam(z~cha+npp+crw+sst.loc+s(t,by=-d2r),
##D         weights=rep(1/P,nrow(glm.data)),family="poisson",offset=log(tau),data=glm.data)
##D summary(fit)
##D 
##D plot(fit)
##D abline(h=0,col="red")
##D 
##D 
##D 
##D 
##D 
##D ############################################################
##D ##
##D ## Overview Plot
##D ##
##D ############################################################
##D 
##D 
##D ## pdf("sealfig.pdf",width=8.5,height=8.85)
##D par(mfrow=c(3,3))
##D ##
##D plot(sst,col=(terrain.colors(30)),main="(a) Sea Surface Temperature")
##D points(xyt[1,1:2]-c(0,.05),type="p",pch=17,cex=2,col="red")
##D points(xyt[,1:2],type="b",pch=20,cex=.75,lwd=1)
##D ##
##D plot(d2r/1000,col=(terrain.colors(30)),main="(b) Distance to Rookery")
##D points(xyt[1,1:2]-c(0,.05),type="p",pch=17,cex=2,col="red")
##D points(xyt[,1:2],type="b",pch=20,cex=.75,lwd=1)
##D ##
##D image(sst,col=rev(terrain.colors(30)),main="(c) Imputed Functional Paths",xlab="",ylab="")
##D for(i in 1:5){
##D     ## points(out$pathlist[[i]]$xy,col=i+1,type="l",lwd=3)
##D     points(out$pathlist[[i]]$xy,col=i+1,type="l",lwd=2)
##D }
##D points(xyt[,1:2],type="p",pch=20,cex=.75,lwd=1)
##D ##
##D ee=extent(c(188.5,190.5,58.4,59.1))
##D sst.crop=crop(sst,ee)
##D bg=sst.crop
##D values(bg)=NA
##D for(i in c(2)){
##D     values(bg)[cellFromXY(bg,out$pathlist[[i]]$xy)] <- 1
##D }
##D image(sst.crop,col=(terrain.colors(30)),xlim=c(188.85,190.2),
##D ylim=c(58.5,59),main="(d) CTMC Path",xlab="",ylab="")
##D image(bg,col="blue",xlim=c(188.85,190.2),ylim=c(58.5,59),add=TRUE)
##D for(i in c(2)){
##D     points(out$pathlist[[i]]$xy,col=i,type="l",lwd=3)
##D }
##D points(xyt[,1:2],type="b",pch=20,cex=2,lwd=2)
##D ##
##D image(sst.crop,col=(terrain.colors(30)),xlim=c(189.62,189.849),
##D ylim=c(58.785,58.895),main="(e) CTMC Model Detail",xlab="",ylab="")
##D abline(v=189.698+res(sst)[1]*c(-1,0,1,2))
##D abline(h=58.823+res(sst)[2]*c(-1,0,1,2))
##D ##
##D plot(fit,main="(f) Time-Varying Response to Rookery",shade=TRUE,
##D shade.col="orange",lwd=3,rug=F,xlab="Day of Trip",
##D ylab="Coefficient of Distance To Rookery")
##D abline(h=0,col="red")
##D ##
##D 
##D 
##D 
##D ###############################################
##D ##
##D ## Get UD (following Kenady et al 2017+)
##D ##
##D ###############################################
##D 
##D RR=get.rate.matrix(fit.SWL,loc.stack,grad.stack)
##D UD=get.UD(RR,method="lu")
##D ud.rast=sst
##D values(ud.rast) <- as.numeric(UD)
##D plot(ud.rast)
##D 
##D 
##D ###############################################
##D ##
##D ## Get shortest path and current maps (following Brennan et al 2017+)
##D ##
##D ###############################################
##D 
##D library(gdistance)
##D 
##D ## create a dummy transition layer from a raster.
##D ## make sure the "directions" argument matches that used in path2ctmc
##D ## also make sure to add the "symm=FALSE" argument
##D trans=transition(sst,mean,directions=4,symm=FALSE)
##D ## now replace the transition object with the "rate" matrix
##D ## so "conductance" values are "transition rates"
##D transitionMatrix(trans) <- RR
##D str(trans)
##D 
##D ##
##D ## now calculate least cost paths using "shortestPath" from gdistance
##D ##
##D 
##D ## pick start and end locations
##D plot(sst)
##D st=c(185,59.5)
##D en=c(190,57.3)
##D 
##D st.cell=cellFromXY(sst,st)
##D en.cell=cellFromXY(sst,en)
##D 
##D ## shortest path
##D sp=shortestPath(trans,st,en,output="SpatialLines")
##D plot(sst,main="Shortest Path (SST in background)")
##D lines(sp,col="brown",lwd=7)
##D 
##D 
##D 
##D ##
##D ## Now calculate "current maps" that show space use of random walkers
##D ## moving between two given locations.
##D ##
##D ## gdistance's "passage" function allows for asymmetric transition rates
##D ##
##D 
##D passage.gdist=passage(trans,st,en,theta=.001,totalNet="net")
##D plot((passage.gdist))
##D 
##D 
## End(Not run)




