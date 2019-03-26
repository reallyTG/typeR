library(MXM)


### Name: Backward phase of MMPC
### Title: Backward phase of MMPC
### Aliases: mmpcbackphase
### Keywords: SES Multiple Feature Signatures Feature Selection Variable
###   Selection

### ** Examples

set.seed(123)

#simulate a dataset with continuous data
dataset <- matrix(runif(1000 * 200, 1, 100), ncol = 200)

#define a simulated class variable 
target <- 3 * dataset[, 10] + 2 * dataset[, 100] + 3 * dataset[, 20] + rnorm(1000, 0, 5)

# define some simulated equivalences
dataset[, 15] <- dataset[, 10] + rnorm(1000, 0, 2)
dataset[, 150] <- dataset[, 100] + rnorm(1000, 0, 2) 
dataset[, 130] <- dataset[, 100] + rnorm(1000, 0, 2)

# MMPC algorithm 
m1 <- MMPC(target, dataset, max_k = 3, threshold = 0.05, test="testIndFisher");
m2 <- MMPC(target, dataset, max_k = 3, threshold = 0.05, test="testIndFisher", backward = TRUE);
x <- dataset[, m1@selectedVars]
mmpcbackphase(target, x, test = testIndFisher)



