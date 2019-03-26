library(htree)


### Name: partdep_hrf
### Title: Partial dependence
### Aliases: partdep_hrf partdep_htb

### ** Examples


## Not run: 
##D 
##D 
##D # library(htree)
##D data(mscm)
##D x=as.data.frame(na.omit(mscm))
##D 
##D 
##D # historical predictors 
##D vh=c("stress","illness")
##D 
##D # concurrent predictors
##D vc=names(x)[-which(is.element(names(x),vh))]
##D control=list(vc=vc,vh=vh,nodesize=20)
##D 
##D 
##D ### -- hrf 
##D ff=hrf(x=x,yindx="illness",id=x$id,time=x$day,control=control)
##D 
##D ## -- baseline illness
##D pp=partdep_hrf(ff,xindx="billness")
##D 
##D 
##D ## -- with bootstrap standard errors
##D control$se=TRUE
##D ff=hrf(x=x,yindx="illness",id=x$id,time=x$day,control=control)
##D 
##D ## -- baseline illness
##D pp=partdep_hrf(ff,xindx="billness")
##D 
##D ## -- mothers stress
##D pp=partdep_hrf(ff,xindx="stress")
##D 
##D 
##D ## -- partial dependence for a subset is done using the 'cond' argument
##D 
##D ## ... only first week 
##D pp=partdep_hrf(ff,xindx="billness",cond="day<=7")
##D 
##D ## ... last week
##D pp=partdep_hrf(ff,xindx="billness",cond="day>23",plot.it=FALSE)
##D points(pp$x,pp$y,type="l",lwd=2,col="blue")
##D 
##D 
##D ## ... first week and employed mothers
##D pp=partdep_hrf(ff,xindx="billness",cond="day<=7&emp==1")
##D 
##D 
##D 
##D ### -- hbt -----
##D # library(htree)
##D data(mscm)
##D x=as.data.frame(na.omit(mscm))
##D 
##D # historic predictors
##D vh=c("stress","illness")
##D # concurrent predictors
##D vc=names(x)[-which(is.element(names(x),vh))]
##D 
##D control=list(vc=vc,vh=vh,cvfold=10,family="bernoulli",ntrees=200,lambda=.1)
##D ff=htb(x=x,yindx="illness",id=x$id,time=x$day,control=control)
##D 
##D vn=c("illness","billness","day","stress")
##D par(mfrow=c(2,2))
##D for(k in vn)
##D 	pp=partdep_htb(ff,xindx=k)
##D par(mfrow=c(1,1))
##D 
##D 
##D ### --- standard error bands and model estimates 
##D # library(htree)
##D sim_data=function(n=100,p=5,pnoise=2,sigma_e=.5,sigma_a=.5){
##D 	## -- random intercept data simulator
##D 	random_intercept=as.numeric(mapply(rep,rnorm(n,sd=sigma_a),times=p))
##D 	dat=data.frame(time=rep(1:p,n),x=(random_intercept+rnorm(n*p,sd=sigma_e)),
##D 		znoise=matrix(rnorm(n*p*pnoise),ncol=pnoise),id=sort(rep(1:n,p)))
##D 	dat
##D }
##D 
##D ## simulate data and estimate model and partial-dependence with standard errors
##D sdat=sim_data()
##D control=list(se=TRUE)
##D h=hrf(x=sdat,yindx="x",id=sdat$id,time=sdat$time,control=control)
##D pp=partdep_hrf(h,xindx="x",xlim=c(-2,2),ngrid=20)
##D 
##D 
##D ## estimate and plot partial dependence on simulated data sets 
##D p_est=NULL
##D nsim=10
##D for(s in 1:nsim)
##D {
##D 	sdat=sim_data()
##D 	hs=hrf(x=sdat,yindx="x",id=sdat$id,time=sdat$time)
##D 	ps=partdep_hrf(hs,xindx="x",plot.it=FALSE,xlim=c(-2,2),ngrid=20)
##D 	p_est=cbind(p_est,ps$y)
##D 	points(ps$x,ps$y,type="l",lty=2,col="blue")
##D }
##D 
##D ## plot of estimated and true standard errors 
##D res=data.frame(se_est=pp$se,se_obs=apply(p_est,1,sd))
##D plot(pp$x,res$se_est,ylim=c(min(res),max(res)),type="l",col="blue",
##D 	main="SE-est(blue) SE-obs(red)",xlab="x",ylab="standard error")
##D points(pp$x,res$se_obs,ylim=c(min(res),max(res)),type="l",col="red")
##D 
##D 
##D 
## End(Not run)




