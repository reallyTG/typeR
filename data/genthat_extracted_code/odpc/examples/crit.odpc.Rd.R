library(odpc)


### Name: crit.odpc
### Title: Automatic Choice of Tuning Parameters for One-Sided Dynamic
###   Principal Components via the Minimization of an Information Criterion
### Aliases: crit.odpc

### ** Examples

T <- 50 #length of series
m <- 10 #number of series
set.seed(1234)
f <- rnorm(T + 1)
x <- matrix(0, T, m)
u <- matrix(rnorm(T * m), T, m)
for (i in 1:m) {
  x[, i] <- 10 * sin(2 * pi * (i/m)) * f[1:T] + 10 * cos(2 * pi * (i/m)) * f[2:(T + 1)] + u[, i]
}
# Choose parameters to perform a one step ahead forecast. Use 1 or 2 lags, only one component 
fit <- crit.odpc(x, k_list = 1:2, max_num_comp = 1)



