library(ROCit)


### Name: plot.gainstable
### Title: Plot '"gainstable"' Object
### Aliases: plot.gainstable

### ** Examples

data("Loan")
class <- Loan$Status
score <- Loan$Score
rocit_emp <- rocit(score = score, class = class, negref = "FP")
# ----------------------------------------------------------------
gtable <- gainstable(rocit_emp)
# ----------------------------------------------------------------
plot(gtable)
plot(gtable, legend = FALSE)
plot(gtable, col = 2:4)
plot(gtable, type = 2, col = 2:4)
plot(gtable, type = 3, col = 2:3)



