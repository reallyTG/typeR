library(binGroup)


### Name: summary.gt
### Title: Summary Method for Group Testing Model (Simple Pooling) Fits
### Aliases: summary.gt
### Keywords: print

### ** Examples

## --- Continuing the Example from '?gtreg':

data(hivsurv)

fit1 <- gtreg(formula = groupres ~ AGE + EDUC., data = hivsurv,
  groupn = gnum, sens = 0.9, spec = 0.9, method = "Xie")

summary(fit1)




