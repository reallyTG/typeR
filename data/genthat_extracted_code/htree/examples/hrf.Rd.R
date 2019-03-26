library(htree)


### Name: hrf
### Title: Random forest for longitudinal data
### Aliases: hrf
### Keywords: nonparametric tree longitudinal

### ** Examples


## Not run: 
##D 
##D # ----------------------------------------------------------------------------------------- ##
##D # Mother's stress on child illness:
##D # 	Investigate whether mother's stress is (Granger) causal for child illness 
##D #	'hrf' model is fit using previous observations of mother's stress to predict 
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
##D data(mscm) 
##D mscm=as.data.frame(na.omit(mscm))
##D 
##D 
##D # -- set concurrent and historical predictors 
##D historical_predictors=match(c("stress","illness"),names(mscm))
##D concurrent_predictors=which(names(mscm)!="stress")
##D 
##D control=list(vh=historical_predictors,vc=concurrent_predictors)
##D 
##D 
##D # -- fit historical random forest
##D #	(NOTE: response is 0/1 so a regression tree is
##D # 	 the same as  a classification tree with Gini-index splitting) 
##D ff=hrf(x=mscm,id=mscm$id,time=mscm$day,yindx="illness",control=control)
##D 
##D # out-of-bag error 
##D plot(1:length(ff$error),ff$error,type="l",main="OOB error",xlab="forest size",ylab="mse")
##D 
##D # .. larger nodesize works slightly better
##D control$nodesize=20
##D ff=hrf(x=mscm,id=mscm$id,time=mscm$day,yindx="illness",control=control)
##D points(1:length(ff$error),ff$error,type="l",col="blue")
##D 
##D 
##D # -- variable importance table 
##D vi=varimp_hrf(ff)
##D vi
##D 
##D 
##D 
##D # -- fit historical random forest with 'se=TRUE'
##D control$se=TRUE
##D ff=hrf(x=mscm,id=mscm$id,time=mscm$day,yindx="illness",control=control)
##D 
##D # -- partial dependence for top 4 predictors (with +/-2 SE estimates) 
##D par(mfrow=c(2,2))
##D for(k in 1:4)
##D 	pd=partdep_hrf(ff,xindx=as.character(vi$Predictor[k]))
##D 
##D par(mfrow=c(1,1))
##D 
##D 
##D 
##D 
##D ## -- Classification trees 
##D 
##D ## setting classify=TRUE builds classification tree (gini-impurity node splitting)
##D control$classify=TRUE
##D ## ... standard error estimation not implemented .. turn off bootstrapping 
##D control$se=FALSE
##D 
##D ff=hrf(x=mscm,id=mscm$id,time=mscm$day,yindx="illness",control=control)
##D 
##D # -- plot oob classification error 
##D plot(1:length(ff$error),ff$error,type="l",xlab="forest size",ylab="oob classification error")
##D abline(mean(mscm$illness),0,lty=2)  ## error of constant model
##D 
##D p=predict_hrf(ff)
##D 
##D ## variable importance table (model error measured by gini-impurity)
##D vi=varimp_hrf(ff)
##D vi
##D 
##D 
##D # -------------------------------- #
##D # Data w/irregular observation times 
##D # ------------------------------- #
##D data(cd4)
##D 
##D control=list(se=TRUE)
##D ff=hrf(x=cd4,id=cd4$id,time=cd4$time,yindx="count",control=control)
##D 
##D vi=varimp_hrf(ff)
##D 
##D # -- partial dependence for top 4 predictors (with +/-2 SE estimates) 
##D par(mfrow=c(2,2))
##D for(k in 1:4)
##D 	pd=partdep_hrf(ff,xindx=as.character(vi$Predictor[k]))
##D par(mfrow=c(1,1))
##D 
##D plot(1:length(ff$error),ff$error,xlab="forest size",ylab="oob mse",type="l")
##D 
##D ## by default, the number of delta values (parameter 'eta_1' above) is 20
##D ## can set this using 'ndelta'  
##D control$ndelta=50
##D 
##D control$se=FALSE # -- turning off bootstrapping .. 
##D ff=hrf(x=cd4,id=cd4$id,time=cd4$time,yindx="count",control=control)
##D points(1:length(ff$error),ff$error,type="l",lty=2)
##D 
##D # the grid of delta values 
##D ff$control$delta
##D 
##D 
##D # --------------------------------------- ##
##D # Boston Housing data (not longitudinal)
##D # --------------------------------------- ##
##D # library(htree)
##D library(mlbench)
##D library(randomForest)
##D 
##D data(BostonHousing)
##D dat=as.data.frame(na.omit(BostonHousing))
##D 
##D 
##D ## omitting arguments time/id assumes rows are iid 
##D control=list(ntrees=500,sample_fraction=.5,nodesize=1)
##D h=hrf(x=dat,yindx="medv",control=control)
##D 
##D ## randomForest comparison 
##D ##	(by default, randomForest samples with replacement, while hrf samples without) 
##D r=randomForest(medv~.,data=dat,replace=F,sampsize=ceiling(.5*nrow(dat)),nodesize=1)
##D 
##D ## plot oob-error for both
##D plot(1:length(r$mse),r$mse,type="l",ylim=c(min(r$mse,h$error),max(r$mse,h$error)),
##D 	main="BostonHousing",xlab="forest size",ylab="out-of-bag mse")
##D points(1:length(h$error),h$error,type="l",col="blue")
##D 
##D ## -- variable importance table
##D vi=varimp_hrf(h)
##D vi
##D 
##D ## -- partial dependence plots with approximate 95##D 
##D control$se=TRUE
##D h=hrf(x=dat,yindx="medv",control=control)
##D 
##D par(mfrow=c(2,2))
##D for(k in 1:4)
##D 	pd=partdep_hrf(h,xindx=as.character(vi$Predictor[k]))
##D 
##D par(mfrow=c(1,1))
##D 
##D 
##D 
## End(Not run)



