library(mipfp)


### Name: vcov.mipfp
### Title: Calculate variance-covariance matrix for mipfp objects
### Aliases: vcov.mipfp
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
# calling the Estimate function
res <- Estimate(seed, target.list, target.data)
# printing the variance-covariance matrix
print(vcov(res))



