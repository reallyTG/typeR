library(timeROC)


### Name: compare
### Title: Compute tests for comparing two time-dependent AUC
### Aliases: compare

### ** Examples

##-------------Without competing risks-------------------
library(survival)
data(pbc)
head(pbc)
pbc<-pbc[!is.na(pbc$trt),] # select only randomised subjects
pbc$status<-as.numeric(pbc$status==2) # create event indicator: 1 for death, 0 for censored

# we evaluate bilirubin as a prognostic biomarker. 
ROC.bili<-timeROC(T=pbc$time,
                  delta=pbc$status,marker=pbc$bili,
                  cause=1,weighting="marginal",
                  times=quantile(pbc$time,probs=seq(0.2,0.8,0.1)),
                  iid=TRUE)

# we evaluate albumin as a prognostic biomarker.
ROC.albumin<-timeROC(T=pbc$time,
                  delta=pbc$status,marker=-pbc$albumin,
                  cause=1,weighting="marginal",
                  times=quantile(pbc$time,probs=seq(0.2,0.8,0.1)),
                  iid=TRUE)

# we compare albumin and bilirubin as prognostic biomarkers.
ROC.albumin #print results for albumin
ROC.bili    #print results for bilirubin
compare(ROC.albumin,ROC.bili) #compute p-values of comparison tests
compare(ROC.albumin,ROC.bili,adjusted=TRUE)

##-------------With competing risks-------------------

data(Melano)
head(Melano)

# Evaluate tumor thickness as a prognostic biomarker for
# death from malignant melanoma.
ROC.thick<-timeROC(T=Melano$time,delta=Melano$status,
                   marker=Melano$thick,cause=1,
                   times=quantile(Melano$time,probs=seq(0.2,0.8,0.2)),
                   iid=TRUE)

# Evaluate age at operation as a prognostic tool for
# death from malignant melanoma.
ROC.age<-timeROC(T=Melano$time,delta=Melano$status,
                 marker=Melano$age,cause=1,
                 times=quantile(Melano$time,probs=seq(0.2,0.8,0.2)),
                 ROC=TRUE,iid=TRUE)

# compare the predictive abilities of tumor thickness and 
# age at operation for death from malignant melanoma.
ROC.thick
ROC.age
compare(ROC.age,ROC.thick,adjusted=TRUE)



## Not run: 
##D 	data(Paquid)
##D 	head(Paquid)
##D 
##D 	# Computation requires approximately   1 minute 
##D 	# (because n=2561 subjects, iid=TRUE, and times=c(3,5,10))
##D 	# evaluate DDST cognitive score as a prognostic tool for
##D 	# dementia onset, accounting for death without dementia competing risk.
##D 	ROC.DSST<-timeROC(T=Paquid$time,delta=Paquid$status,
##D     		              marker=-Paquid$DSST,cause=1,
##D         		          times=c(3,5,10),ROC=TRUE,iid=TRUE)
##D 	ROC.DSST
##D 
##D 	# Computation requires approximately   1 minute 
##D 	# (because n=2561 subjects, iid=TRUE, and times=c(3,5,10))
##D 	# evaluate MMSE cognitive score as a prognostic tool for
##D 	# dementia onset, accounting for death without dementia competing risk.
##D 	ROC.MMSE<-timeROC(T=Paquid$time,delta=Paquid$status,
##D     		              marker=-Paquid$MMSE,cause=1,
##D         		          times=c(3,5,10),ROC=TRUE,iid=TRUE)
##D 	
##D 	# we compare MMSE and DSST cognitive tests as prognostic tools
##D 	# for dementia, accounting for death without dementia competing risk.
##D 	ROC.DSST
##D 	ROC.MMSE
##D 	compare(ROC.DSST,ROC.MMSE,adjusted=TRUE)
## End(Not run)






