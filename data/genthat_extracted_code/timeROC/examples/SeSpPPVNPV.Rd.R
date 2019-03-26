library(timeROC)


### Name: SeSpPPVNPV
### Title: Time-dependent Sensitivity (Se), Specificity (Sp), Positive
###   Predictive Value (PPV) and Negative Predictive Value (NPV) estimation
### Aliases: SeSpPPVNPV

### ** Examples

##-------------Without competing risks-------------------
library(survival)
data(pbc)
head(pbc)
pbc<-pbc[!is.na(pbc$trt),] # select only randomised subjects
pbc$status<-as.numeric(pbc$status==2) # create event indicator: 1 for death, 0 for censored     
# Se, Sp, PPV and NPV computation for serum bilirunbin at threshold c=0.9(mg/dl) 
res.SeSpPPVNPV.bili <- SeSpPPVNPV(cutpoint=0.9,
                                  T=pbc$time,
                                  delta=pbc$status,marker=pbc$bili,
                                  cause=1,weighting="marginal",
                                  times=quantile(pbc$time,probs=seq(0.2,0.8,0.1)),
                                  iid=TRUE)
res.SeSpPPVNPV.bili

##-------------With competing risks-------------------

#---------Example with Paquid data--------
data(Paquid)
# Se, Sp, PPV and NPV computation for DSST at threshold c=22
res.SeSpPPVNPV.DSST <- SeSpPPVNPV(cutpoint=22,
                                  T=Paquid$time,
                                  delta=Paquid$status,marker=Paquid$DSST,
                                  cause=1,weighting="cox",
                                  times=c(3,5,8,10))
res.SeSpPPVNPV.DSST

#---------Example with Melano data-------
data(Melano)
# Se, Sp, PPV and NPV computation for tumor thickness at threshold c=3 (1/100 mm)
res.SeSpPPVNPV.thick <- SeSpPPVNPV(cutpoint=3,
                                  T=Melano$time,delta=Melano$status,
                                  weighting="marginal",
                                  marker=Melano$thick,cause=1,
                                  times=c(1800,2000,2200),
                                  iid=TRUE)
res.SeSpPPVNPV.thick



