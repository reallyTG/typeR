library(sortinghat)


### Name: simdata_t
### Title: Generates random variates from K multivariate Student's t
###   populations.
### Aliases: simdata_t

### ** Examples

# Generates 10 observations from each of two multivariate t populations
# with equal covariance matrices and equal degrees of freedom.
centroid_list <- list(c(3, 0), c(0, 3))
cov_identity <- diag(2)
data_generated <- simdata_t(n = c(10, 10), centroid = centroid_list,
                            cov = cov_identity, df = 4, seed = 42)
dim(data_generated$x)
table(data_generated$y)

# Generates 10 observations from each of three multivariate t populations
# with unequal covariance matrices and unequal degrees of freedom.
set.seed(42)
centroid_list <- list(c(-3, -3), c(0, 0), c(3, 3))
cov_list <- list(cov_identity, 2 * cov_identity, 3 * cov_identity)
data_generated2 <- simdata_t(n = c(10, 10, 10), centroid = centroid_list,
                             cov = cov_list, df = c(4, 6, 10))
dim(data_generated2$x)
table(data_generated2$y)



