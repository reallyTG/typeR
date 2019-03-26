library(caRamel)


### Name: newXval
### Title: newXval
### Aliases: newXval

### ** Examples

# Definition of the parameters
param <- matrix(rexp(100), 100, 1)
crit <- matrix(rexp(200), 100, 2)
isperf <- c(FALSE, FALSE)
bounds <- matrix(data = 1, nrow = 1, ncol = 2)
bounds[, 1] <- -5 * bounds[, 1]
bounds[, 2] <- 10 * bounds[, 2]
sp <- (bounds[, 2] - bounds[, 1]) / (2 * sqrt(3))
repart_gene <- c(5, 5, 5, 5)
fireworks <- TRUE
blocks <- NULL
# Call the function
res <- newXval(param, crit, isperf, sp, bounds, repart_gene, blocks, fireworks)




