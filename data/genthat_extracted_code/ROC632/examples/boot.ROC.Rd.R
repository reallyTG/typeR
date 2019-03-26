library(ROC632)


### Name: boot.ROC
### Title: Construction of a diagnostic or prognostic scoring system and
###   estimation of its true diagnostic capacities when the data are
###   complete (without censoring)
### Aliases: boot.ROC
### Keywords: 0.632 bootstrap ROC curve

### ** Examples


# import and attach the data example

data(DLBCLpatients)
data(DLBCLgenes)

# In this exemple, we only reduce the number
# of features, threasholds and iterations for time-saving

DLBCLgenes <- DLBCLgenes[,1:500] # 500 first features
N.iterations <- 2

# If we define a priori the tuning parameter at 15.

res <- boot.ROC(status=DLBCLpatients$f,
 features=DLBCLgenes, N.boot=N.iterations,
 precision=seq(0.05, 0.95, by=0.30), lambda1=15)

# The distribution of the prognostic score
hist(res$Signature, nclass=30, main="",
 xlab="Observed values of the multivariate signature")

# Illustrations of the ROC curve
plot(res$ROC.Apparent$FPR, 1-res$ROC.Apparent$FNR,
 type="b", pch=1, lty=1, ylim=c(0,1), xlim=c(0,1),
 ylab="True Positive Rates",
 xlab="False Positive Rates") 
lines(res$ROC.CV$FPR, 1-res$ROC.CV$FNR,
 type="b", pch=2, lty=2) 
lines(res$ROC.632$FPR, 1-res$ROC.632$FNR,
 type="b", pch=3, lty=3) 
lines(res$ROC.632p$FPR, 1-res$ROC.632p$FNR,
 type="b", pch=4, lty=4) 
legend("bottomright",
 paste(c("Apparent", "CV", "0.632", "0.632+"),
 "curve (AUC=", round(res$AUC,2), ")"), pch=1:4,
 lty=1:4)




