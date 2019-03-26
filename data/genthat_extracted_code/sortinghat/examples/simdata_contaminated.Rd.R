library(sortinghat)


### Name: simdata_contaminated
### Title: Generates random variates from K multivariate contaminated
###   normal populations.
### Aliases: simdata_contaminated

### ** Examples

# Generates 10 observations from each of two multivariate contaminated normal
# populations with equal covariance matrices. Each population has a
# contamination probability of 0.05 and scale contamination of 10.
mean_list <- list(c(1, 0), c(0, 1))
cov_identity <- diag(2)
data <- simdata_contaminated(n = c(10, 10), mean = mean_list,
                             cov = cov_identity, epsilon = 0.05, kappa = 10,
                             seed = 42)
dim(data$x)
table(data$y)

# Generates 10 observations from each of three multivariate contaminated
# normal populations with unequal covariance matrices. The contamination
# probabilities and scales differ for each population as well.
set.seed(42)
mean_list <- list(c(-3, -3), c(0, 0), c(3, 3))
cov_list <- list(cov_identity, 2 * cov_identity, 3 * cov_identity)
data2 <- simdata_contaminated(n = c(10, 10, 10), mean = mean_list,
                              cov = cov_list, epsilon = c(0.05, 0.1, 0.2),
                              kappa = c(2, 5, 10))
dim(data2$x)
table(data2$y)



