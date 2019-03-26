library(sortinghat)


### Name: simdata_normal
### Title: Generates random variates from K multivariate normal
###   populations.
### Aliases: simdata_normal

### ** Examples

# Generates 10 observations from each of two multivariate normal populations
# with equal covariance matrices.
mean_list <- list(c(1, 0), c(0, 1))
cov_identity <- diag(2)
data_generated <- simdata_normal(n = c(10, 10), mean = mean_list,
                                 cov = cov_identity, seed = 42)
dim(data_generated$x)
table(data_generated$y)

# Generates 10 observations from each of three multivariate normal
# populations with unequal covariance matrices.
set.seed(42)
mean_list <- list(c(-3, -3), c(0, 0), c(3, 3))
cov_list <- list(cov_identity, 2 * cov_identity, 3 * cov_identity)
data_generated2 <- simdata_normal(n = c(10, 10, 10), mean = mean_list,
                                  cov = cov_list)
dim(data_generated2$x)
table(data_generated2$y)



