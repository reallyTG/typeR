library(MXM)


### Name: Fast MMPC
### Title: A fast version of MMPC
### Aliases: mmpc2
### Keywords: SES Multiple Feature Signatures Feature Selection Variable
###   Selection

### ** Examples

set.seed(123)

#simulate a dataset with continuous data
dataset <- matrix(runif(100 * 500, 1, 100), ncol = 500)

#define a simulated class variable 
target <- 3 * dataset[, 10] + 2 * dataset[, 100] + 3 * dataset[, 20] + rnorm(100, 0, 5)
m <- median(target)
target[target < m] <- 0
target[abs(target) > 0 ] <- 1

m1 <- mmpc2(target, dataset, max_k = 3, threshold = 0.05, test="testIndLogistic")
m1$selectedVars  ## S3 class, $, not @
m1$runtime

m2 <- MMPC(target, dataset, max_k = 3, threshold = 0.05, test="testIndLogistic")
m2@selectedVars  ## S3 class, @, not $
m2@runtime



