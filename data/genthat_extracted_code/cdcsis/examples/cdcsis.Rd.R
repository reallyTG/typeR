library(cdcsis)


### Name: cdcsis
### Title: Conditional Distance Correlation Sure Independence Screening
###   (CDC-SIS)
### Aliases: cdcsis
### Keywords: conditional correlation, dimensional distance independence
###   screening, sure ultrahigh

### ** Examples

library(cdcsis)

########## univariate explanation variables ##########
set.seed(1)
num <- 100
p <- 200
x <- matrix(rnorm(num * p), nrow = num)
z <- rnorm(num)
y <- 3 * x[, 1] + 1.5 * x[, 2] + 4 * z * x[, 5] + rnorm(num)
res <- cdcsis(x, y, z)
head(res[["ix"]], n = 10)

########## multivariate explanation variables ##########
x <- as.list(as.data.frame(x))
x <- lapply(x, as.matrix)
x[[1]] <- cbind(x[[1]], x[[2]])
x[[2]] <- NULL
res <- cdcsis(x, y, z)
head(res[["ix"]], n = 10)




