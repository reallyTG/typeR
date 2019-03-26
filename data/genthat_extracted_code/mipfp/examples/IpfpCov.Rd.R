library(mipfp)


### Name: IpfpCov
### Title: Covariance matrix of the estimators produced by Ipfp
###   (deprecated)
### Aliases: IpfpCov
### Keywords: models multivariate array

### ** Examples

# true contingency (2-way) table
true.table <- array(c(43, 44, 9, 4), dim = c(2, 2))
# generation of sample, i.e. the seed to be updated
seed <- ceiling(true.table / 10)
# desired targets (margins)
target.row <- apply(true.table, 2, sum)
target.col <- apply(true.table, 1, sum)
# storing the margins in a list
target.data <- list(target.col, target.row)
# list of dimensions of each marginal constrain
target.list <- list(1, 2)
# calling the Ipfp function
res <- Ipfp(seed, target.list, target.data)
# computation of the covariance matrix of the produced estimated probabilities
res.cov <- IpfpCov(res$x.hat, seed, target.list)
# 0.95 level confidence interval of the estimates
n <- sum(res$x.hat)
# ... lower bound
ci.lb <- Array2Vector(res$x.hat) - 1.96 * sqrt(n * diag(res.cov))
# ... upperbound
ci.ub <- Array2Vector(res$x.hat) + 1.96 * sqrt(n * diag(res.cov))



