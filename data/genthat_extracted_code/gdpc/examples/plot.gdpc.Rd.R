library(gdpc)


### Name: plot.gdpc
### Title: Plot Generalized Dynamic Principal Components
### Aliases: plot.gdpc
### Keywords: ts

### ** Examples

T <- 200 #length of series
m <- 200 #number of series
set.seed(1234)
f <- rnorm(T + 1)
x <- matrix(0, T, m)
u <- matrix(rnorm(T * m), T, m)
for (i in 1:m) {
    x[, i] <- 10 * sin(2 * pi * (i/m)) * f[1:T] + 10 * cos(2 * pi * (i/m)) * f[2:(T + 1)] + u[, i]
}
#Choose number of lags using the LOO type criterion.
#k_max=3 to keep computation time low
autofit <- auto.gdpc(x, k_max = 3) 
plot(autofit[[1]], xlab = '', ylab = '')



