library(SingleCaseES)


### Name: LOR
### Title: Log-odds ratio
### Aliases: LOR

### ** Examples

A_pct <- c(20, 20, 25, 25, 20, 25)
B_pct <- c(30, 25, 25, 25, 35, 30, 25)
LOR(A_data = A_pct, B_data = B_pct,
    scale = "percentage", intervals = 20, bias_correct = FALSE)
LOR(A_data = A_pct, B_data = B_pct,
    scale = "percentage", intervals = 20)

LOR(A_data = A_pct, B_data = B_pct, scale = "percentage")
LOR(A_data = A_pct / 100, B_data = B_pct / 100, scale = "proportion")
LOR(A_data = A_pct, B_data = B_pct, scale = "percentage", improvement = "decrease")




