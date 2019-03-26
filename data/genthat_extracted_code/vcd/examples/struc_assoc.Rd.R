library(vcd)


### Name: struc_assoc
### Title: Core-generating Function for Association Plots
### Aliases: struc_assoc
### Keywords: hplot

### ** Examples

## UCB Admissions
data("UCBAdmissions")
ucb <- aperm(UCBAdmissions)

## association plot for conditional independence
strucplot(ucb, expected = ~ Dept * (Admit + Gender),
  core = struc_assoc(ylim = c(-4, 4)), labeling_args = list(abbreviate = c(Admit = 3)))



