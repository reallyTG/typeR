library(timeROC)


### Name: timeROC
### Title: Time-dependent ROC curve estimation
### Aliases: timeROC
### Keywords: survival ROC

### ** Examples

##-------------Without competing risks-------------------
library(survival)
data(pbc)
head(pbc)
pbc<-pbc[!is.na(pbc$trt),] # select only randomised subjects
pbc$status<-as.numeric(pbc$status==2) # create event indicator: 1 for death, 0 for censored

# we evaluate bilirubin as a prognostic biomarker for death.

# 1) with the Kaplan-Meier estimator for computing the weights (default).
ROC.bili.marginal<-timeROC(T=pbc$time,
                  delta=pbc$status,marker=pbc$bili,
                  cause=1,weighting="marginal",
                  times=quantile(pbc$time,probs=seq(0.2,0.8,0.1)),
                  iid=TRUE)
ROC.bili.marginal

# 2) with a Cox model (with covariates bili, chol and albumin) for computing the weights.
ROC.bili.cox<-timeROC(T=pbc$time,
                      delta=pbc$status,marker=pbc$bili,
                      other_markers=as.matrix(pbc[,c("chol","albumin")]),
                      cause=1,weighting="cox",
                      times=quantile(pbc$time,probs=seq(0.2,0.8,0.1)))
ROC.bili.cox

##-------------With competing risks-------------------


#---------Example with Melano data-------
data(Melano)

# Evaluate tumor thickness as a prognostic biomarker for
# death from malignant melanoma.
ROC.thick<-timeROC(T=Melano$time,delta=Melano$status,
                   weighting="aalen",
                   marker=Melano$thick,cause=1,
                   times=c(1800,2000,2200))
ROC.thick

#---------Example with Paquid data--------
data(Paquid)

# evaluate DDST cognitive score as a prognostic tool for
# dementia onset, accounting for death without dementia competing risk.
ROC.DSST<-timeROC(T=Paquid$time,delta=Paquid$status,
                  marker=-Paquid$DSST,cause=1,
                  weighting="cox",
                  other_markers=as.matrix(Paquid$MMSE),
                  times=c(3,5,10),ROC=TRUE)
ROC.DSST 
plot(ROC.DSST,time=5)        



