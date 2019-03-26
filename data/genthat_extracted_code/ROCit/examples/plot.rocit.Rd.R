library(ROCit)


### Name: plot.rocit
### Title: Plot ROC Curve
### Aliases: plot.rocit

### ** Examples

data("Loan")
score <- Loan$Score
class <- ifelse(Loan$Status == "FP", 0, 1)
rocit_emp <- rocit(score = score, class = class)
# -----------------------
plot(rocit_emp)
plot(rocit_emp, col = c(2,4), legendpos = "bottom",
     YIndex = FALSE, values = FALSE)
# -----------------------
rocit_bin <- rocit(score = score, class = class, method = "bin")
# -----------------------
plot(rocit_emp, col = c(1,"gray50"), legend = FALSE, YIndex = FALSE)
lines(rocit_bin$TPR~rocit_bin$FPR, col = 2, lwd = 2)
legend("bottomright", col = c(1,2),
       c("Empirical ROC", "Binormal ROC"), lwd = 2)




