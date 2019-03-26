library(ROCt)


### Name: adjusted.ROCt
### Title: Confounders-Adjusted Time-Dependent ROC Curves With Right
###   Censored Data.
### Aliases: adjusted.ROCt
### Keywords: adjusted

### ** Examples

# import and attach the data example
data(dataDIVAT)

# A subgroup analysis to reduce the time needed for this exemple

dataDIVAT <- dataDIVAT[1:400,]

# The standardized and weighted time-dependent ROC curve to evaluate the
# capacities of the recipient age for the prognosis of post kidney
# transplant mortality up to 2000 days by taking into account the
# donor age and the recipient gender.

# 1. Standardize the marker according to the covariates among the controls
lm1 <- lm(ageR ~ ageD + sexeR, data=dataDIVAT[dataDIVAT$death.time >= 2500,])
dataDIVAT$ageR_std <- (dataDIVAT$ageR - (lm1$coef[1] + lm1$coef[2] * dataDIVAT$ageD +
 lm1$coef[3] * dataDIVAT$sexeR)) / sd(lm1$residuals)

# 2. Compute the sensitivity and specificity from the proposed IPW estimators
roc2 <- adjusted.ROCt(times="death.time", failures="death", variable="ageR_std",
confounders=~bs(ageD, df=3) + sexeR, database=dataDIVAT, pro.time=2000,
precision=seq(0.1,0.9, by=0.2))
# The corresponding ROC graph
plot(1-roc2$table$sp, roc2$table$se, ylim=c(0,1), xlim=c(0,1), ylab="sensitivity",
xlab="1-specificity", type="l", lty=1, col=1, lwd=2)
abline(c(0,0), c(1,1), lty=2)
# The corresponding AUC
roc2$auc


