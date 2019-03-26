library(timeROC)


### Name: plotAUCcurveDiff
### Title: Plot the curve of the difference of two time-dependent AUCs over
###   time
### Aliases: plotAUCcurveDiff

### ** Examples

## Not run: 
##D ## computation times is roughly 10 seconds
##D 
##D ##-------------Without competing risks-------------------
##D library(survival)
##D data(pbc)
##D head(pbc)
##D pbc<-pbc[!is.na(pbc$trt),] # select only randomised subjects
##D pbc$status<-as.numeric(pbc$status==2) # create event indicator: 1 for death, 0 for censored     
##D # we evaluate bilirubin as a prognostic biomarker for death.
##D ROC.bili<-timeROC(T=pbc$time,
##D                   delta=pbc$status,marker=pbc$bili,
##D                   cause=1,weighting="marginal",
##D                   times=quantile(pbc$time,probs=seq(0.2,0.8,0.02)),
##D                   iid=TRUE)
##D ROC.bili    
##D # we evaluate bilirubin as a prognostic biomarker for death.
##D ROC.albumin<-timeROC(T=pbc$time,
##D                      delta=pbc$status,marker=-pbc$albumin,
##D                      cause=1,weighting="marginal",
##D                      times=quantile(pbc$time,probs=seq(0.2,0.8,0.02)),
##D                      iid=TRUE)
##D ROC.albumin
##D # plot AUC curve for albumin and bilirunbin  with pointwise confidence interval
##D plotAUCcurve(ROC.albumin,conf.int=TRUE,col="red")
##D plotAUCcurve(ROC.bili,conf.int=TRUE,col="blue",add=TRUE)
##D legend("bottomright",c("albumin","bilirunbin"),col=c("red","blue"),lty=1,lwd=2)
##D #plot the curve of the difference of the two time-dependent AUCs over time
##D plotAUCcurveDiff(ROC.bili,ROC.albumin,conf.int=TRUE,conf.band=TRUE,ylim=c(-0.2,0.5))
##D 
##D ##-------------With competing risks-------------------     
##D data(Melano)
##D head(Melano)     
##D # Evaluate tumor thickness as a prognostic biomarker for
##D # death from malignant melanoma.
##D ROC.thick<-timeROC(T=Melano$time,delta=Melano$status,
##D                    marker=Melano$thick,cause=1,
##D                    times=quantile(Melano$time,probs=seq(0.2,0.8,0.01)),
##D                    iid=TRUE)
##D ROC.thick
##D ROC.age<-timeROC(T=Melano$time,delta=Melano$status,
##D                    marker=Melano$age,cause=1,
##D                    times=quantile(Melano$time,probs=seq(0.2,0.8,0.01)),
##D                    iid=TRUE)
##D ROC.age
##D # plot the two AUC curves on the same plot
##D plotAUCcurve(ROC.thick,FP=2,conf.int=TRUE,col="blue")
##D plotAUCcurve(ROC.age,FP=2,conf.int=TRUE,col="red",add=TRUE)
##D legend("bottomright",c("thickness","age"),col=c("blue","red"),lty=1,lwd=2)
##D # plot the curve of the difference of the two time-dependent AUCs over time
##D plotAUCcurveDiff(ROC.thick,ROC.age,FP=2,conf.int=TRUE,conf.band=TRUE,col="red")
## End(Not run)



