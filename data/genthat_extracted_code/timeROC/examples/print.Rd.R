library(timeROC)


### Name: print
### Title: Print objects in the timeROC library
### Aliases: print.ipcwsurvivalROC print.ipcwcompetingrisksROC
###   print.ipcwcompetingrisksSeSpPPVNPV print.ipcwsurvivalSeSpPPVNPV

### ** Examples

##-------------Without competing risks-------------------
library(survival)
data(pbc)
head(pbc)
pbc<-pbc[!is.na(pbc$trt),] # select only randomised subjects
pbc$status<-as.numeric(pbc$status==2) # create event indicator: 1 for death, 0 for censored

ROC.bili.cox<-timeROC(T=pbc$time,
                      delta=pbc$status,marker=pbc$bili,
                      other_markers=as.matrix(pbc[,c("chol","albumin")]),
                      cause=1,weighting="cox",
                      times=quantile(pbc$time,probs=seq(0.2,0.8,0.01)))

# prints descriptive statistics and AUC estimates (5,10 and 20 lines)
print(ROC.bili.cox)
print(ROC.bili.cox,No.lines=10)
print(ROC.bili.cox,No.lines=20,digits=1)

# Se, Sp, PPV and NPV computation for serum bilirunbin at threshold c=0.9(mg/dl) 
res.SeSpPPVNPV.bili <- SeSpPPVNPV(cutpoint=0.9,
                                  T=pbc$time,
                                  delta=pbc$status,marker=pbc$bili,
                                  other_markers=as.matrix(pbc[,c("chol","albumin")]),
                                  cause=1,weighting="cox",
                                  times=quantile(pbc$time,probs=seq(0.2,0.8,0.1)))

# prints descriptive statistics and Se, Sp, PPV and NPV
#  estimates for serum bilirunbin at threshold c=0.9(mg/dl) 
print(res.SeSpPPVNPV.bili,No.lines=20,digits=1)

ROC.bili.marginal<-timeROC(T=pbc$time,
                           delta=pbc$status,marker=pbc$bili,
                           cause=1,weighting="marginal",
                           times=quantile(pbc$time,probs=seq(0.1,0.9,0.2)),
                           iid=TRUE)

# prints descriptive statistics, AUC estimates and also standard errors
# of AUCs because weighting="marginal" and iid=TRUE were used.
print(ROC.bili.marginal)

##-------------With competing risks-------------------
data(Melano)
ROC.thick<-timeROC(T=Melano$time,delta=Melano$status,
                   marker=Melano$thick,cause=1,
                   weighting="marginal",
                   times=c(1500,2000,2500),iid=TRUE)

# prints descriptive statistics, AUC estimates and also standard errors
# of AUCs because weighting="marginal" and iid=TRUE were used.
print(ROC.thick)


# Se, Sp, PPV and NPV computation for tumor thickness at
#threshold c=3 (1/100 mm)
res.SeSpPPVNPV.thick <- SeSpPPVNPV(cutpoint=3,
                                  T=Melano$time,delta=Melano$status,
                                  weighting="marginal",
                                  marker=Melano$thick,cause=1,
                                  times=c(1800,2000,2200),
                                  iid=TRUE)
print(res.SeSpPPVNPV.thick,digits=1)



