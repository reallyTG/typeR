library(robCompositions)


### Name: pfa
### Title: Factor analysis for compositional data
### Aliases: pfa
### Keywords: multivariate

### ** Examples


data(expenditures)
x <- expenditures
res.rob <- pfa(x, factors=1)
res.cla <- pfa(x, factors=1, robust=FALSE)


## the following produce always the same result:
res1 <- pfa(x, factors=1, covmat="covMcd")
res2 <- pfa(x, factors=1, covmat=covMcd(pivotCoord(x))$cov)
res3 <- pfa(x, factors=1, covmat=covMcd(pivotCoord(x)))




