library(BioMark)


### Name: scalefun
### Title: Different forms of scaling
### Aliases: scalefun
### Keywords: manip multivariate

### ** Examples

X <- gen.data(5, nvar = 9, nsimul = 1)
FUN <- scalefun(sc.p = "pareto")
FUN(X$X[,,1])



