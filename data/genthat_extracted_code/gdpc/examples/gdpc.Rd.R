library(gdpc)


### Name: gdpc
### Title: Generalized Dynamic Principal Components
### Aliases: gdpc
### Keywords: ts

### ** Examples

T <- 200 #length of series
m <- 500 #number of series
set.seed(1234)
f <- rnorm(T + 1)
x <- matrix(0, T, m)
u <- matrix(rnorm(T * m), T, m)
for (i in 1:m) {
    x[, i] <- 10 * sin(2 * pi * (i/m)) * f[1:T] + 10 * cos(2 * pi * (i/m)) * f[2:(T + 1)] + u[, i]
}
fit <- gdpc(x, k = 1) #find first DPC with one lag
fit
par(mfrow = c(1, 2)) #plot loadings
plot(fit, which = 'Loadings', which_load = 0, xlab = '', ylab = '') 
plot(fit, which = 'Loadings', which_load = 1, xlab = '', ylab = '') 



