library(binGroup)


### Name: gtreg.halving
### Title: Fitting Group Testing Models Under the Halving Protocol
### Aliases: gtreg.halving EM.halving
### Keywords: models regression

### ** Examples


## --- Continuing the Example from  '?sim.halving':

set.seed(46)
gt.data <- sim.halving(par = c(-6, .1), gshape = 17, gscale = 1.4,
               sample.size = 5000, group.size = 5,
               sens = 0.95, spec = 0.95)
fit1 <- gtreg.halving(formula = gres ~ x, data = gt.data, groupn = groupn,
        start = c(-6, .1), subg = subgroup, retest = retest,
        sens = .95, spec = .95, trace = TRUE)
summary(fit1)




