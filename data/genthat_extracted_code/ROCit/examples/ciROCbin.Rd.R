library(ROCit)


### Name: ciROCbin
### Title: Confidence Interval of Binormal ROC Curve
### Aliases: ciROCbin

### ** Examples

data("Loan")
score <- Loan$Score
class <- ifelse(Loan$Status == "CO", 1, 0)
rocit_bin <- rocit(score = score, class = class, method = "bin")
ciROC_bin90 <- ciROCbin(rocit_bin, level = 0.9, nboot = 300)
TPR <- ciROC_bin90$TPR
FPR <- ciROC_bin90$FPR
Upper90 <- ciROC_bin90$UpperTPR
Lower90 <- ciROC_bin90$LowerTPR
plot(TPR~FPR, type = "l")
lines(Upper90~FPR, lty = 2)
lines(Lower90~FPR, lty = 2)
grid()
legend("bottomright", c("Binormal ROC curve", "90% CI"), lty = c(1,2))




