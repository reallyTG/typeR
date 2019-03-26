library(parsec)


### Name: LE2incidence
### Title: Computes the incidence matrices of lexicographic linear
###   extensions of a profile poset.
### Aliases: LE2incidence LE2incidence.default LE2incidence.list

### ** Examples

Lambda <- getlambda(A < B, C < D)
plot(Lambda)
lst <- LE(Lambda)
vl <- c(A = 2, B = 2, C = 2, D = 2)
lstZeta <- LE2incidence(lst, varlen = vl)
for (x in lstZeta)
    plot(x)



