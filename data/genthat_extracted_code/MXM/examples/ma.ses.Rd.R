library(MXM)


### Name: Constraint based feature selection algorithms for multiple datasets
### Title: ma.ses: Feature selection algorithm for identifying multiple
###   minimal, statistically-equivalent and equally-predictive feature
###   signatures with multiple datasets ma.mmpc: Feature selection
###   algorithm for identifying minimal feature subsets with multiple
###   datasets
### Aliases: ma.ses ma.mmpc
### Keywords: SES Multiple Feature Signatures Feature Selection Variable
###   Selection

### ** Examples

set.seed(123)

#simulate a dataset with continuous data
dataset <- matrix(runif(1000 * 100, 1, 100), ncol = 100)

#define a simulated class variable 
target <- 3 * dataset[, 10] + 2 * dataset[, 20] + 3 * dataset[, 30] + rnorm(1000, 0, 5)

#define some simulated equivalences
dataset[, 15] <- dataset[, 10] + rnorm(1000, 0, 2)
dataset[, 10] <- dataset[ , 10] + rnorm(1000, 0, 2)
dataset[, 25] <- dataset[, 20] + rnorm(1000, 0, 2) 
dataset[, 23] <- dataset[, 20] + rnorm(1000, 0, 2)

#run the SES algorithm
a1 <- SES(target , dataset, max_k = 5, threshold = 0.05, test = "testIndFisher", 
hash = TRUE, hashObject = NULL)

ina <- rbinom(1000, 2, 0.5) + 1
a2 <- ma.ses(target , dataset, ina = ina, max_k = 5, threshold = 0.05, test = "testIndFisher", 
hash = TRUE, hashObject = NULL)
a3 <- ma.mmpc(target , dataset, ina = ina, max_k = 5, threshold = 0.05, test = "testIndFisher", 
hash = TRUE, hashObject = NULL)

#get the generated signatures
a1@signatures
a2@signatures
a3@selectedVars




