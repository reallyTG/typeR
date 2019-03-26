library(ROCt)


### Name: adjusted.ROC
### Title: Confounders-Adjusted ROC Curves Without Right Censored Data.
### Aliases: adjusted.ROC
### Keywords: adjusted

### ** Examples


# import and attach the data example

data(dataDIVAT)

# A subgroup analysis to reduce the time needed for this exemple

dataDIVAT <- dataDIVAT[1:400,]

# The ROC curve to evaluate the crude capacities of the recipient age for the
# prognosis of post kidney transplant mortality (we ignore the censoring process)

roc1 <- adjusted.ROC(status="death", variable="ageR", confounders=~1,
database=dataDIVAT, precision=seq(0.1,0.9, by=0.1) )

# The standardized and weighted ROC curve to evaluate the capacities
# of the recipient age for the prognosis of post kidney transplant
# mortality by taking into account the donor age and the recipient
# gender (we ignore the censoring process).

# 1. Standardize the marker according to the covariates among the controls
lm1 <- lm(ageR ~ ageD + sexeR, data=dataDIVAT[dataDIVAT$death == 0,])
dataDIVAT$ageR_std <- (dataDIVAT$ageR - (lm1$coef[1] + lm1$coef[2] *
 dataDIVAT$ageD + lm1$coef[3] * dataDIVAT$sexeR)) / sd(lm1$residuals)

# 2. Compute the sensitivity and specificity from the proposed IPW estimators
roc2 <- adjusted.ROC(status="death", variable="ageR_std",
 confounders=~bs(ageD, df=3) + sexeR, database=dataDIVAT, precision=seq(0.1,0.9, by=0.1))

# The corresponding ROC graph
plot(1-roc1$table$sp, roc1$table$se, ylim=c(0,1), xlim=c(0,1), ylab="sensitivity",
xlab="1-specificity", type="l", lty=1, col=1, lwd=2)
lines(1-roc2$table$sp, roc2$table$se, col=2, lwd=2, lty=2)
abline(c(0,0), c(1,1), lty=2)
legend("bottomright", lty=1:2, lwd=2, col=1:2, c(paste("Crude estimation,
 (AUC=", round(roc1$auc, 2), ")", sep=""),paste("Adjusted estimation,
 (AUC=", round(roc2$auc, 2), ")", sep="") ) )



