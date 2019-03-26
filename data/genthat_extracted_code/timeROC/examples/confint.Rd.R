library(timeROC)


### Name: confint
### Title: Confidence intervals for areas under time-dependent ROC curves
### Aliases: confint.ipcwsurvivalROC confint.ipcwcompetingrisksROC

### ** Examples

##-------------Without competing risks-------------------
library(survival)
data(pbc)
head(pbc)
pbc<-pbc[!is.na(pbc$trt),] # select only randomised subjects
pbc$status<-as.numeric(pbc$status==2) # create event indicator: 1 for death, 0 for censored

# we evaluate bilirubin as a prognostic biomarker for death.
ROC.bili<-timeROC(T=pbc$time,
                  delta=pbc$status,marker=pbc$bili,
                  cause=1,weighting="marginal",
                  times=quantile(pbc$time,probs=seq(0.2,0.8,0.1)),
                  iid=TRUE)
ROC.bili
confint(ROC.bili)


##-------------With competing risks-------------------

data(Melano)
head(Melano)

# Evaluate tumor thickness as a prognostic biomarker for
# death from malignant melanoma.
ROC.thick<-timeROC(T=Melano$time,delta=Melano$status,
                   marker=Melano$thick,cause=1,
                   times=quantile(Melano$time,probs=seq(0.2,0.8,0.2)),
                   iid=TRUE)
ROC.thick
confint(ROC.thick)

## Not run: 
##D 	data(Paquid)
##D 	head(Paquid)
##D 	
##D 	# Computation requires approximately 30 seconds 
##D 	# (because iid=TRUE and n=2561 subjects)	
##D 	# evaluate DDST cognitive score as a prognostic tool for
##D 	# dementia onset, accounting for death without dementia competing risk.	
##D 	ROC.DSST<-timeROC(T=Paquid$time,
##D                       delta=Paquid$status,marker=-Paquid$DSST,
##D                       cause=1,weighting="marginal",times=c(3,5),
##D                       ROC=TRUE,iid=TRUE)
##D 	ROC.DSST
##D 	confint(ROC.DSST)
## End(Not run) 



