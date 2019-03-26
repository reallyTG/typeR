library(mada)


### Name: sens
### Title: Sensitivity, Specificity and False Positive Rate
### Aliases: sens fpr spec

### ** Examples

data(AuditC)
plot(fpr(AuditC), sens(AuditC), main = "AUDIT-C data on ROC space",
     ylab = "Sensitivity", xlab = "False Positive Rate")



