library(ROCit)


### Name: gainstable.rocit
### Title: Gains Table for Binary Classifier
### Aliases: gainstable.rocit

### ** Examples

data("Loan")
class <- Loan$Status
score <- Loan$Score
rocit_emp <- rocit(score = score, class = class, negref = "FP")
# ----------------------------------------------------------------
gtable15 <- gainstable(rocit_emp, ngroup = 15)
gtable_custom <- gainstable(rocit_emp, breaks = seq(1,100,15))
print(gtable15)
print(gtable_custom)
# ----------------------------------------------------------------
plot(gtable15)
plot(gtable_custom)
plot(gtable_custom, type = 2)
plot(gtable_custom, type = 3)




