library(PenCoxFrail)


### Name: pencoxfrail
### Title: Regularization in Cox Frailty Models.
### Aliases: pencoxfrail pencoxfrail
### Keywords: Lasso, Shrinkage, Variable selection, Generalized linear
###   mixed model

### ** Examples

## Not run: 
##D data(lung)
##D 
##D # remove NAs
##D lung <- lung[!is.na(lung$inst),]
##D 
##D # transform inst into factor variable
##D lung$inst <- as.factor(lung$inst)
##D 
##D # Random institutional effect
##D fix.form <- as.formula("Surv(time, status) ~ 1")
##D vary.coef <- as.formula("~ age")
##D 
##D pen.obj <- pencoxfrail(fix=fix.form,vary.coef=vary.coef, rnd = list(inst=~1), 
##D               data=lung, xi=10,control=list(print.iter=TRUE))
##D 
##D # show fit
##D plot(pen.obj)
##D 
##D # predict survival curve of new subject, institution 1 and up to time 500
##D pred.obj <- predict(pen.obj,newdata=data.frame(inst=1,time=NA,status=NA,age=26),
##D               time.grid=seq(0,500,by=1))
##D 
##D # plot predicted hazard function
##D plot(pred.obj$time.grid,pred.obj$haz,type="l",xlab="time",ylab="hazard")
##D 
##D # plot predicted survival function
##D plot(pred.obj$time.grid,pred.obj$survival,type="l",xlab="time",ylab="survival")
##D 
##D # see also demo("pencoxfrail-pbc")
## End(Not run)


