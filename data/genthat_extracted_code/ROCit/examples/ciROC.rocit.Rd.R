library(ROCit)


### Name: ciROC.rocit
### Title: Confidence Interval of ROC curve
### Aliases: ciROC.rocit

### ** Examples

data("Loan")
score <- Loan$Score
class <- ifelse(Loan$Status == "CO", 1, 0)
rocit_emp <- rocit(score = score, class = class, method = "emp")
# ------------------------------------------------
ciROC_emp90 <- ciROC(rocit_emp, level = 0.9)
plot(ciROC_emp90, egend = TRUE)




