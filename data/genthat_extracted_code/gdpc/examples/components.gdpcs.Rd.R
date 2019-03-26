library(gdpc)


### Name: components.gdpcs
### Title: Get Generalized Dynamic Principal Components From a gdpcs Object
### Aliases: components.gdpcs
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
#Choose number of lags using the LOO criterion.
#k_max=2 to keep computation time low
autofit <- auto.gdpc(x, k_max = 2, auto_comp = FALSE, num_comp = 2) 
comps <- components(autofit, which_comp = c(1,2))



