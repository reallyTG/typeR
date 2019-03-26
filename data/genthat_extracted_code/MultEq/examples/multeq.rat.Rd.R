library(MultEq)


### Name: multeq.rat
### Title: Equivalence for ratios of means of multiple endpoints
### Aliases: multeq.rat
### Keywords: htest

### ** Examples

data(clinic)

comp <- multeq.rat(data=clinic,grp="fact",method="step.up",margin.up=rep(1.25,5),
                   margin.lo=1/rep(1.25,5))
summary(comp)



