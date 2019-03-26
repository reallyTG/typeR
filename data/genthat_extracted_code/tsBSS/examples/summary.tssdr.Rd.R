library(tsBSS)


### Name: summary.tssdr
### Title: Summary of an object of class tssdr
### Aliases: summary.tssdr
### Keywords: methods

### ** Examples

n <- 10000
A <- matrix(rnorm(9), 3, 3)

x1 <- arima.sim(n = n, list(ar = 0.2))
x2 <- arima.sim(n = n, list(ar = 0.8))
x3 <- arima.sim(n = n, list(ar = 0.3, ma = -0.4))
eps2 <- rnorm(n - 1)
y <- 2*x1[1:(n - 1)] + 3*x2[1:(n - 1)] + eps2
X <- ((cbind(x1, x2, x3))[2:n, ]) %*% t(A)

res2 <- tssdr(y, X, algorithm = "TSIR")
res2
summ2 <- summary(res2, thres = 0.5)
summ2
summary(res2) #Chooses more lags with larger threshold
summary(res2, type = "alllag") #Chooses all lags
summary(res2, type = "alldir", thres = 0.5) #Chooses all directions
summary(res2, type = "big", thres = 0.5) #Same choices than in summ2




