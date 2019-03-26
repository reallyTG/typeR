library(ROCt)


### Name: crude.ROCt
### Title: Time-Dependent ROC Curves With Right Censored Data.
### Aliases: crude.ROCt
### Keywords: crude

### ** Examples


# import and attach the data example

data(dataDIVAT)

# A subgroup analysis to reduce the time needed for this exemple

dataDIVAT <- dataDIVAT[1:400,]

# cut-off values definition (choose more values in prectice)

age.cut <- quantile(dataDIVAT$ageR, probs=seq(0.1, 0.9, by=0.1))

# the ROC curve (with the naive estimator) to predict the all-cause
# mortality up to the 3000 days

roc1 <- crude.ROCt(times=dataDIVAT$death.time,
 failures=dataDIVAT$death, variable=dataDIVAT$ageR,
 pro.time=3000, cut.off=age.cut, estimator="naive")

# the sensibilities and specificities associated with the cut off values

roc1$table

# the ROC curve (Kaplan-Meier estimator without the knn correction)
# to predict the all-cause mortality up to the 3000 days

# the ROC graph

plot(1-roc1$table$sp, roc1$table$se, ylim=c(0,1), xlim=c(0,1), ylab="sensitivity",
 xlab="1-specificity", type="l", lty=1, col=2, lwd=2)
 
abline(c(0,0), c(1,1), lty=2)

legend("bottomright", paste("Naive, (AUC=", round(roc1$auc, 2), ")", sep=""),
lty=1, lwd=2, col=2)

# the AUC

roc1$auc

AUC(sens=roc1$table$se, spec=roc1$table$sp)



