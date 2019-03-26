library(parsec)


### Name: summary.cover
### Title: Summary method for cover and incidence objects.
### Aliases: summary.cover summary.incidence

### ** Examples

vl <- c(2, 3, 3)
prf <- var2prof(varlen = vl)
Z <- getzeta(prf)
summary(Z)
C <- incidence2cover(Z)
summary(C)



