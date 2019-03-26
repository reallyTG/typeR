library(SingleCaseES)


### Name: SMD
### Title: Within-case standardized mean difference
### Aliases: SMD

### ** Examples

A <- c(20, 20, 26, 25, 22, 23)
B <- c(28, 25, 24, 27, 30, 30, 29)
SMD(A_data = A, B_data = B, bias_correct = FALSE)
SMD(A_data = A, B_data = B)
SMD(A_data = A, B_data = B, std_dev = "pool")




