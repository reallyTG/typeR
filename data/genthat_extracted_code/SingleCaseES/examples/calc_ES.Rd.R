library(SingleCaseES)


### Name: calc_ES
### Title: Calculate effect sizes
### Aliases: calc_ES

### ** Examples

# Using the A_data and B_data arguments
A <- c(20, 20, 26, 25, 22, 23)
B <- c(28, 25, 24, 27, 30, 30, 29)
calc_ES(A_data = A, B_data = B)

# Using the condition and outcome arguments
phase <- c(rep("A", length(A)), rep("B", length(B)))
outcome <- c(A, B)
calc_ES(condition = phase, outcome = outcome, baseline_phase = "A")

# Example from Parker & Vannest (2009)
yA <- c(4, 3, 4, 3, 4, 7, 5, 2, 3, 2)
yB <- c(5, 9, 7, 9, 7, 5, 9, 11, 11, 10, 9)
calc_ES(yA, yB)




