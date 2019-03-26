library(mipfp)


### Name: ObtainModelEstimates
### Title: Estimating a contingency table using model-based approaches
### Aliases: ObtainModelEstimates
### Keywords: models multivariate array

### ** Examples

# set-up an initial 3-way table of dimension (2 x 2 x 2)
seed <- Vector2Array(c(80, 60, 20, 20, 40, 35, 35, 30), dim = c(c(2, 2, 2)))

# building target margins
margins12 <- c(2000, 1000, 1500, 1800)
margins12.array <- Vector2Array(margins12, dim=c(2, 2))
margins3 <- c(4000,2300)
margins3.array <- Vector2Array(margins3, dim = 2) 
target.list <- list(c(1, 2), 3)
target.data <- list(margins12.array, margins3.array)

# estimating the new contingency table using the ml method
results.ml <- ObtainModelEstimates(seed, target.list, target.data, 
                                   compute.cov = TRUE)
print(results.ml)

# estimating the new contingency table using the chi2 method
results.chi2 <- ObtainModelEstimates(seed, target.list, target.data, 
                                     method = "chi2", compute.cov = TRUE)
print(results.chi2)

# estimating the new contingency table using the lsq method
results.lsq <- ObtainModelEstimates(seed, target.list, target.data,
                                    method = "lsq", compute.cov = TRUE)
print(results.lsq)



