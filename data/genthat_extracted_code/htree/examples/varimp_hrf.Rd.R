library(htree)


### Name: varimp_hrf
### Title: Variable importance
### Aliases: varimp_htb varimp_hrf

### ** Examples

## Not run: 
##D 
##D data(mscm) 
##D mscm=as.data.frame(na.omit(mscm))
##D 
##D 
##D # -- set concurrent and historical predictors 
##D historical_predictors=match(c("stress","illness"),names(mscm))
##D concurrent_predictors=which(names(mscm)!="stress")
##D control=list(vh=historical_predictors,vc=concurrent_predictors,nodesize=20)
##D 
##D ## -- fit model
##D ff=hrf(x=mscm,id=mscm$id,time=mscm$day,yindx="illness",control=control)
##D 
##D # -- variable importance table
##D vi=varimp_hrf(ff)
##D vi
##D 
##D 
##D ## same with htb
##D 
##D control=list(vh=historical_predictors,vc=concurrent_predictors,
##D 	lambda=.1,ntrees=200,nsplit=3,family="bernoulli")
##D control$cvfold=10 ## need cross-validation runs to run varimp_htb
##D ff=htb(x=mscm,id=mscm$id,time=mscm$day,yindx="illness",control=control)
##D 
##D # -- variable importance table
##D vi=varimp_htb(ff)
##D vi
##D 
##D 
##D 
##D 
##D # --------------------------------------------------------------------------------------------- ##
##D # Boston Housing data 
##D #	Comparison of Z-score variable importance with coefficient Z-scores from linear model
##D # --------------------------------------------------------------------------------------------- ##
##D 
##D # Boston Housing data 
##D library(mlbench)
##D data(BostonHousing)
##D dat=as.data.frame(na.omit(BostonHousing))
##D dat$chas=as.numeric(dat$chas)
##D 
##D # -- random forest 
##D h=hrf(x=dat,yindx="medv")
##D 
##D 
##D # -- tree boosting
##D hb=htb(x=dat,yindx="medv",ntrees=1000,cv.fold=10,nsplit=3)
##D 
##D 
##D # -- Comparison of variable importance Z-scores and Z-scores from linear model 
##D vi=varimp_hrf(h)
##D vb=varimp_htb(hb)
##D dvi=data.frame(var=as.character(vi$Predictor),Z_hrf=vi$Z)
##D dvb=data.frame(var=as.character(vb$Predictor),Z_htb=vb$Z)
##D 
##D dlm=summary(lm(medv~.,dat))$coeffi
##D dlm=data.frame(var=rownames(dlm),Z_lm=round(abs(dlm[,3]),3))
##D dlm=merge(dlm[-1,],dvi,by="var",all.x=TRUE)
##D 
##D # -- Z-scores of hrf and lm for predictor variables 
##D merge(dlm,dvb,by="var",all.x=TRUE)
##D 
##D 
##D 
## End(Not run)




