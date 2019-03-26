library(mpe)


### Name: atleast.one.endpoint
### Title: At least one Endpoint with Known Covariance
### Aliases: atleast.one.endpoint
### Keywords: multivariate

### ** Examples

## compute power
atleast.one.endpoint(K = 2, delta = c(0.2,0.2), Sigma = diag(c(1,1)), power = 0.8)

## compute sample size
atleast.one.endpoint(K = 2, delta = c(0.2,0.2), Sigma = diag(c(2,2)), power = 0.9)

## known covariance matrix
Sigma <- matrix(c(1.440, 0.840, 1.296, 0.840,
                  0.840, 1.960, 0.168, 1.568,
                  1.296, 0.168, 1.440, 0.420,
                  0.840, 1.568, 0.420, 1.960), ncol = 4)
## compute power
atleast.one.endpoint(K = 4, n = 60, delta = c(0.5, 0.75, 0.5, 0.75), Sigma = Sigma)
## equivalent: known SDs and correlation rho
atleast.one.endpoint(K = 4, n = 60, delta = c(0.5, 0.75, 0.5, 0.75),
                SD = c(1.2, 1.4, 1.2, 1.4), rho = c(0.5, 0.9, 0.5, 0.1, 0.8, 0.25))



