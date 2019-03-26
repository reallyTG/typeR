library(htree)


### Name: htb
### Title: Tree boosting for longitudinal data
### Aliases: htb
### Keywords: nonparametric tree longitudinal

### ** Examples


## Not run: 
##D 
##D 
##D # ----------------------------------------------------------------------------------------- ##
##D # Mother's stress on child illness:
##D # 	Investigate whether mother's stress is (Granger) causal of child illness 
##D #	'htb' model is fit using previous observations of mother's stress to predict 
##D #	child's illness at given time point, but not mother's stress at that time point
##D #
##D #	Predictor variables are classified into "historical" and "concurrent"
##D #
##D #	A predictor is "historical" if its prior realizations can be used to predict 
##D #	the outcome.   
##D #
##D #	A predictor is "concurrent" if its realization at the same timepoint as the outcome
##D #	can be used to predict the outcome at that timepoint
##D #
##D #	A predictor can be both "concurrent" and "historical", the status of the predictors 
##D #	can be set by the 'vh' and 'vc' arguments of 'hrf'. 
##D #	(if not set these are automatically determined) 
##D #	 
##D # ------------------------------------------------------------------------------------------- ##
##D 
##D 
##D data(mscm) 
##D mscm=as.data.frame(na.omit(mscm))
##D 
##D 
##D # -- set concurrent and historical predictors 
##D historical_predictors=match(c("illness","stress"),names(mscm))
##D concurrent_predictors=which(names(mscm)!="stress")
##D control=list(vh=historical_predictors,vc=concurrent_predictors,
##D 	ntrees=200,family="bernoulli",cvfold=10,lambda=.1)
##D 
##D # logistic regression
##D ff=htb(x=mscm,id=mscm$id,time=mscm$day,yindx="illness",control=control)
##D 
##D # cross-validated negative log-likelihood
##D plot(1:ff$ntrees,ff$cv_error,type="l",#col="blue",
##D 	xlab="iterations",ylab="cross-validation error")
##D 
##D # -- variable importance table 
##D vi=varimp_htb(ff)
##D vi
##D 
##D # -- plot partial dependence (with +/-2 approximate standard errors)
##D par(mfrow=c(2,2))
##D for(k in 1:4)
##D 	partdep_htb(ff,xindx=as.character(vi$Predictor[k]))
##D 
##D par(mfrow=c(1,1))
##D 
##D 
##D # -- Standard errors are based on cross-validation runs (using delete-d 
##D #	(subjects) jackknife estimator, d="number-of-subjects"/cvfold)
##D # -- increasing nfold (which defaults to equal cvfold) gives less 
##D #	noisy standard error estimates ...    
##D control$nfold=50  
##D ff=htb(x=mscm,id=mscm$id,time=mscm$day,yindx="illness",control=control)
##D 
##D par(mfrow=c(2,2))
##D for(k in 1:4)
##D 	partdep_htb(ff,xindx=as.character(vi$Predictor[k]))
##D 
##D par(mfrow=c(1,1))
##D 
##D 
##D # -------------------------------- #
##D # Data w/irregular observation times 
##D # ------------------------------- #
##D data(cd4)
##D 
##D control=list(cvfold=10,lambda=.1,nsplit=3,ntrees=200)
##D ff=htb(x=cd4,id=cd4$id,time=cd4$time,yindx="count",control=control)
##D 
##D vi=varimp_htb(ff)
##D 
##D # -- partial dependence for top 4 predictors (with +/-2 SE estimates) 
##D par(mfrow=c(2,2))
##D for(k in 1:4)
##D 	pd=partdep_htb(ff,xindx=as.character(vi$Predictor[k]))
##D par(mfrow=c(1,1))
##D 
##D 
##D # -- cv error
##D plot(1:ff$control$ntrees,ff$cv_error,xlab="boosting iteration",
##D 	ylab="cross-validated mse",type="l")
##D # estimated boosting iteration
##D abline(v=ff$nboost_cv,lty=2)
##D 
##D ## by default, the number of delta values (parameter 'eta_1' above) is 20
##D ## can set this using 'ndelta'  
##D control$ndelta=50
##D 
##D ff=htb(x=cd4,id=cd4$id,time=cd4$time,yindx="count",control=control)
##D points(1:ff$control$ntrees,ff$cv_error,type="l",lty=2)  
##D ## note: differences in cv_error can be due (in part) to randomness
##D ##	 in out-of-sample selection
##D 
##D # the grid of delta values 
##D ff$control$delta
##D 
##D 
##D # ------------------------------------------ #
##D # Boston Housing data (not longitudinal)
##D # ------------------------------------------ #
##D # library(htree)
##D library(mlbench)
##D data(BostonHousing)
##D dat=as.data.frame(na.omit(BostonHousing))
##D 
##D 
##D # omitting arguments 'time' and 'id' assumes rows are iid 
##D control=list(cvfold=10,ntrees=500)
##D h=htb(x=dat,yindx="medv",control=control)
##D 
##D 
##D # -- plot cross-validated Mean-squared error --- #
##D plot(1:h$ntrees,h$cv_error,type="l",xlab="Boosting iterations",
##D 	ylab="MSE",main="Cross-validated Mean-squared error")
##D 
##D # -- variable importance table
##D vi=varimp_htb(h,nperm=20)
##D vi 
##D 
##D # -- partial dependence of top 4 predictors with +/-2 S.E.
##D par(mfrow=c(2,2))
##D for(k in 1:4)
##D 	partdep_htb(h,xindx=as.character(vi$Predictor[k]))
##D 
##D 
##D par(mfrow=c(1,1))
##D 
## End(Not run)




