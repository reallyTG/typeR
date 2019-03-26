library(ROCit)


### Name: print.gainstable
### Title: Print "gainstable" Object
### Aliases: print.gainstable

### ** Examples

data("Loan")
class <- Loan$Status
score <- Loan$Score
rocit_emp <- rocit(score = score, class = class, negref = "FP")
# ----------------------------------------------------------------
gtable8 <- gainstable(rocit_emp, ngroup = 8)
print(gtable8)
print(gtable8, maxdigit = 4)



