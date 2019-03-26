library(htree)


### Name: predict_hrf
### Title: Prediction
### Aliases: predict_htb predict_hrf
### Keywords: classif regression

### ** Examples


## Not run: 
##D 
##D # ------------------------------- #
##D # Simulated data example          #
##D # ------------------------------- #
##D # library(htree)
##D p=5;sigma_e=.5;sigma_a=.5;n=500;pnoise=2
##D random_intercept=as.numeric(mapply(rep,rnorm(n,sd=sigma_a),times=p))
##D dat=data.frame(time=rep(1:p,n),
##D 	x=(random_intercept+rnorm(n*p,sd=sigma_e)),
##D 	znoise=matrix(rnorm(n*p*pnoise),ncol=pnoise))
##D id=sort(rep(1:n,p))
##D 
##D # fit historical random forest
##D hb=hrf(x=dat,time=dat$time,id=id,yindx=2,se=TRUE)
##D 
##D # get predictions with standard errors
##D pred=predict_hrf(hb,se=TRUE)
##D 
##D 
##D # ------------------------------------------------------------------ #
##D # Comparison of SE-estimates with actual standard errors for 'hrf'
##D # ------------------------------------------------------------------ #  
##D 
##D 
##D ## -- evaluation points
##D n=200
##D datp=data.frame(y=rep(0,n),w=seq(-2,2,length=n),z=rep(0,n))
##D 
##D ## -- estimate model on 50 simulated data sets
##D pred=NULL
##D pred_se=NULL
##D nsim=20
##D 
##D ## -- B=100 bootstrap samples, ensemble size of R=10 on each
##D control=list(ntrees=500,B=100,R=10,se=TRUE,nodesize=5)
##D for(k in 1:nsim){
##D 	
##D 	if(is.element(k,seq(1,nsim,by=10)))
##D 		cat(paste("simulation: ",k," of ",nsim," \n",sep=""))
##D 	# -- simulation model -- #
##D 	dat=data.frame(y=(4*datp$w+rnorm(n)),x=datp$w,z=rnorm(n))
##D 	# ---------------------- #
##D 	h=hrf(x=dat,yindx="y",control=control)
##D 	mm=predict_hrf(object=h,x=datp,se=TRUE)
##D 	pred=cbind(pred,mm[,1])
##D 	pred_se=cbind(pred_se,mm[,2])
##D }
##D 
##D 
##D # --- Actual Standard errors at datp 
##D pred_se_true=apply(pred,1,sd)
##D 
##D # --- Mean of estimated standard errors
##D pred_se_est=apply(pred_se,1,mean)
##D pred_se_lower=apply(pred_se,1,quantile,prob=.1)
##D pred_se_upper=apply(pred_se,1,quantile,prob=.9) 
##D 
##D 
##D # -- Plot estimated SE and true SE (+smooth)
##D z=c(pred_se_true,pred_se_est,pred_se_lower,pred_se_upper)
##D ylim=c(min(z),max(z))
##D plot(datp$w,pred_se_est,ylim=ylim,col="blue",xlab="w",
##D 	ylab="Standard error",type="l",main=" SE-true (red) SE-est (blue)")
##D points(datp$w,pred_se_lower,col="blue",type="l",lty=2)
##D points(datp$w,pred_se_upper,col="blue",type="l",lty=2)
##D 
##D points(datp$w,pred_se_true,col="red",type="l")
##D 
##D  
##D 
##D 
##D 
##D # ------------------------------------------------------------------ #
##D # Comparison of SE-estimates with actual standard errors for 'htb'
##D # ------------------------------------------------------------------ #  
##D 
##D 
##D ## -- evaluation points
##D n=200
##D datp=data.frame(y=rep(0,n),w=seq(-2,2,length=n),z=rep(0,n))
##D 
##D ## -- estimate model on 50 simulated data sets
##D pred=NULL
##D pred_se=NULL
##D nsim=20
##D for(k in 1:nsim){
##D 	
##D 	if(is.element(k,seq(1,nsim,by=10)))
##D 		cat(paste("simulation: ",k," of ",nsim," \n",sep=""))
##D 	# -- simulation model -- #
##D 	dat=data.frame(y=(4*datp$w+rnorm(n)),x=datp$w,z=rnorm(n))
##D 	# ---------------------- #
##D 	h=htb(x=dat,yindx="y",ntrees=200,cv.fold=10)
##D 	mm=predict_htb(object=h,x=datp,se=TRUE)
##D 	pred=cbind(pred,mm[,1])
##D 	pred_se=cbind(pred_se,mm[,2])
##D }
##D 
##D 
##D # --- Actual Standard errors at datp 
##D pred_se_true=apply(pred,1,sd)
##D 
##D # --- Mean of estimated standard errors
##D pred_se_est=apply(pred_se,1,mean)
##D pred_se_lower=apply(pred_se,1,quantile,prob=.1)
##D pred_se_upper=apply(pred_se,1,quantile,prob=.9) 
##D 
##D 
##D # -- Plot estimated SE and true SE (+smooth)
##D z=c(pred_se_true,pred_se_est,pred_se_lower,pred_se_upper)
##D ylim=c(min(z),max(z))
##D plot(datp$w,pred_se_est,ylim=ylim,col="blue",xlab="w",
##D 	ylab="Standard error",type="l",main=" SE-true (red) SE-est (blue)")
##D points(datp$w,pred_se_lower,col="blue",type="l",lty=2)
##D points(datp$w,pred_se_upper,col="blue",type="l",lty=2)
##D 
##D points(datp$w,pred_se_true,col="red",type="l")
##D 
##D 
##D 
##D 
## End(Not run)



