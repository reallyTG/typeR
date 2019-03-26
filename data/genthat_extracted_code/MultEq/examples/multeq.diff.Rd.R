library(MultEq)


### Name: multeq.diff
### Title: Equivalence for differences of means of multiple endpoints
### Aliases: multeq.diff
### Keywords: htest

### ** Examples

data(clinic)

comp <- multeq.diff(data=clinic,grp="fact",method="step.up",margin.up=rep(0.6,5),
                    margin.lo=-rep(0.6,5))
summary(comp)



