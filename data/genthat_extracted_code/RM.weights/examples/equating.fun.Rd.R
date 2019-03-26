library(RM.weights)


### Name: equating.fun
### Title: Equating scales between different application contexts.
### Aliases: equating.fun

### ** Examples

data(data.FAO_country1)
XX.country1 = data.FAO_country1[,1:8]
wt.country1 = data.FAO_country1$wt
rr1=RM.w(XX.country1, wt.country1)
data(data.FAO_country2)
XX.country2 = data.FAO_country2[,1:8]
wt.country2 = data.FAO_country2$wt
rr2=RM.w(XX.country2, wt.country2)
# Iterative equating
ee1=equating.fun(rr1, st=rr2$b, thres=c(-0.28, 1.85), spec.com1=c(1:8),spec.com2=c(1:8))
# Not iterative equating: fixing WORRIED unique
ee2=equating.fun(rr1, st=rr2$b, thres=c(-0.28, 1.85),spec.com1=c(1:8),
spec.com2=c(1:8), tol = .4,iterative=FALSE,excl.prior1=1,excl.prior2=1)
# Prevalence rates
ee1$prevs
ee2$prevs



