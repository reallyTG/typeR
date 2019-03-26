library(mpe)


### Name: power.known.var
### Title: Multiple Co-Primary Endpoints with Known Covariance
### Aliases: power.known.var
### Keywords: htest multivariate

### ** Examples

## compute power
power.known.var(K = 2, n = 20, delta = c(1,1), Sigma = diag(c(1,1)))

## compute sample size
power.known.var(K = 2, delta = c(1,1), Sigma = diag(c(2,2)), power = 0.9,
                sig.level = 0.025)

## known covariance matrix
Sigma <- matrix(c(1.440, 0.840, 1.296, 0.840,
                  0.840, 1.960, 0.168, 1.568,
                  1.296, 0.168, 1.440, 0.420,
                  0.840, 1.568, 0.420, 1.960), ncol = 4)
## compute power
power.known.var(K = 4, n = 60, delta = c(0.5, 0.75, 0.5, 0.75), Sigma = Sigma)
## equivalent: known SDs and correlation rho
power.known.var(K = 4, n = 60,delta = c(0.5, 0.75, 0.5, 0.75),
                SD = c(1.2, 1.4, 1.2, 1.4), rho = c(0.5, 0.9, 0.5, 0.1, 0.8, 0.25))



