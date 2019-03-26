library(binGroup)


### Name: gtreg
### Title: Fitting Group Testing Models
### Aliases: gtreg gtreg.fit EM EM.ret
### Keywords: models regression

### ** Examples


data(hivsurv)

fit1 <- gtreg(formula = groupres ~ AGE + EDUC., data = hivsurv,
           groupn = gnum, sens = 0.9, spec = 0.9, method = "Xie")
fit1

## --- Continuing the Example from  '?sim.gt':

set.seed(46)
gt.data <- sim.gt(par = c(-12, 0.2), sample.size = 700, group.size = 5)
fit2 <- gtreg(formula = gres ~ x, data = gt.data, groupn = groupn)
fit2

set.seed(21)
gt.data <- sim.gt(par = c(-12, 0.2), sample.size = 700, group.size = 6,
               sens = 0.95, spec = 0.95, sens.ind = 0.98, spec.ind = 0.98)
fit1 <- gtreg(formula = gres ~ x, data = gt.data, groupn = groupn, 
        retest = retest, method = "X", sens = 0.95, spec = 0.95, sens.ind = 0.98,
        spec.ind = 0.98, trace = TRUE)
summary(fit1)





