library(MXM)


### Name: Certificate of exclusion from the selected variables set using SES or MMPC
### Title: Certificate of exclusion from the selected variables set using
###   SES or MMPC
### Aliases: certificate.of.exclusion certificate.of.exclusion2

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
# run the SES algorithm
mod1 <- SES(target, dataset, max_k = 5, threshold = 0.05, test = "testIndFisher", 
hash = TRUE, hashObject = NULL);
mod2 <- MMPC(target, dataset, max_k = 5, threshold = 0.05, test = "testIndFisher", 
hash = TRUE, hashObject = NULL);
certificate.of.exclusion(c(10,15,30,45,20), mod1)
certificate.of.exclusion(c(10,15,30,45,20), NULL, mod2)



