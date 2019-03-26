library(SharpeR)


### Name: plambdap
### Title: The lambda-prime distribution.
### Aliases: plambdap qlambdap rlambdap
### Keywords: distribution

### ** Examples

rvs <- rnorm(128)
pvs <- plambdap(rvs, 253*6, 0.5)
plot(ecdf(pvs))
pvs <- plambdap(rvs, 253*6, 1)
plot(ecdf(pvs))
pvs <- plambdap(rvs, 253*6, -0.5)
plot(ecdf(pvs))
# test vectorization:
qv <- qlambdap(0.1,128,2)
qv <- qlambdap(c(0.1),128,2)
qv <- qlambdap(c(0.2),128,2)
qv <- qlambdap(c(0.2),253,2)
qv <- qlambdap(c(0.1,0.2),128,2)
qv <- qlambdap(c(0.1,0.2),c(128,253),2)
qv <- qlambdap(c(0.1,0.2),c(128,253),c(2,4))
qv <- qlambdap(c(0.1,0.2),c(128,253),c(2,4,8,16))
# random generation
rv <- rlambdap(1000,252,2)




