library(qpcR)


### Name: llratio
### Title: Calculation of likelihood ratios for nested models
### Aliases: llratio
### Keywords: models nonlinear

### ** Examples

## Compare l5 and l4 model.
m1 <- pcrfit(reps, 1, 2, l5)
m2 <- pcrfit(reps, 1, 2, l4)
llratio(m1, m2)



