library(ROCit)


### Name: gainstable.default
### Title: Gains Table for Binary Classifier
### Aliases: gainstable.default

### ** Examples

data("Loan")
class <- Loan$Status
score <- Loan$Score
# ----------------------------------------------------------------
gtable15 <- gainstable(score = score, class = class,
                       negref = "FP", ngroup = 15)
gtable_custom <- gainstable(score = score, class = class,
                            negref = "FP", breaks = seq(1,100,15))
# ----------------------------------------------------------------
print(gtable15)
print(gtable_custom)
# ----------------------------------------------------------------
plot(gtable15)
plot(gtable_custom)
plot(gtable_custom, type = 2)
plot(gtable_custom, type = 3)




