library(MultEq)


### Name: MultEq-package
### Title: Equivalence for multiple endpoints
### Aliases: MultEq-package MultEq
### Keywords: package

### ** Examples

data(clinic)

comp <- multeq.diff(data=clinic,grp="fact",method="step.up",margin.up=rep(0.6,5),
                    margin.lo=-rep(0.6,5))
summary(comp)



