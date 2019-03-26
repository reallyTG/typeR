library(nsRFA)


### Name: varLmoments
### Title: Exact variance structure of sample L-moments
### Aliases: varLmoments varLCV varLCA varLkur
### Keywords: univar

### ** Examples

x <- rnorm(30,10,2)
varLmoments(x)
varLmoments(x, FALSE)

varLCV(x)
varLCA(x)
varLkur(x)

data(hydroSIMN)
x <- annualflows["dato"][,]
cod <- annualflows["cod"][,]
dvarLmom <- function(x) {diag(varLmoments(x))}
sapply(split(x,cod),dvarLmom)




