library(mipfp)


### Name: GetConfInt
### Title: Computing confidence intervals for the estimated counts and
###   probabilities (deprecated)
### Aliases: GetConfInt
### Keywords: multivariate

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
# addint the standart deviations to res (required by GetConfInt)
cov.res <- vcov(res, seed = seed, target.list = target.list, 
                target.data = target.data)
res$p.hat.se <- cov.res$p.hat.se
res$x.hat.se <- cov.res$x.hat.se
# computing and printing the confidence intervals
print(GetConfInt(res))



