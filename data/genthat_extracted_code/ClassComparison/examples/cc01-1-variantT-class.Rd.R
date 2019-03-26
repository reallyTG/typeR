library(ClassComparison)


### Name: variantT
### Title: Classes for Variant T-tests
### Aliases: MultiTtestPaired MultiTtestUnequal MultiTtestPaired-class
###   MultiTtestUnequal-class summary,MultiTtestPaired-method
###   summary,MultiTtestUnequal-method
### Keywords: classes multivariate htest

### ** Examples

showClass("MultiTtestPaired")
showClass("MultiTtestUnequal")
ng <- 10000
ns <- 50
dat <- matrix(rnorm(ng*ns), ncol=ns)
cla <- factor(rep(c('A', 'B'), each=25))
res <- MultiTtestUnequal(dat, cla)
summary(res)
hist(res, breaks=101)
plot(res, res@p.values)

pairing <- rep(1:25, 2)
res <- MultiTtestPaired(dat, cla, pairing)
summary(res)
plot(res)
hist(res@p.values, breaks=101)



