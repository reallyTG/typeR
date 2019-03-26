library(tensorBSS)


### Name: tNSS.SD
### Title: NSS-SD Method for Tensor-Valued Time Series
### Aliases: tNSS.SD
### Keywords: multivariate array

### ** Examples

# Create innovation series with block-wise changing variances

# 9 smooth variance structures
var_1 <- function(n){
  t <- 1:n
  return(1 + cos((2*pi*t)/n)*sin((2*150*t)/(n*pi)))
}

var_2 <- function(n){
  t <- 1:n
  return(1 + sin((2*pi*t)/n)*cos((2*150*t)/(n*pi)))
}

var_3 <- function(n){
  t <- 1:n
  return(0.5 + 8*exp((n+1)^2/(4*t*(t - n - 1))))
}

var_4 <- function(n){
  t <- 1:n
  return(3.443 - 8*exp((n+1)^2/(4*t*(t - n - 1))))
}

var_5 <- function(n){
  t <- 1:n
  return(0.5 + 0.5*gamma(10)/(gamma(7)*gamma(3))*(t/(n + 1))^(7 - 1)*(1 - t/(n + 1))^(3 - 1))
}

var_6 <- function(n){
  t <- 1:n
  res <- var_5(n)
  return(rev(res))
}

var_7 <- function(n){
  t <- 1:n
  return(0.2+2*t/(n + 1))
}

var_8 <- function(n){
  t <- 1:n
  return(0.2+2*(n + 1 - t)/(n + 1))
}

var_9 <- function(n){
  t <- 1:n
  return(1.5 + cos(4*pi*t/n))
}


# Innovation series
n <- 1000

innov1 <- c(rnorm(n, 0, sqrt(var_1(n))))
innov2 <- c(rnorm(n, 0, sqrt(var_2(n))))
innov3 <- c(rnorm(n, 0, sqrt(var_3(n))))
innov4 <- c(rnorm(n, 0, sqrt(var_4(n))))
innov5 <- c(rnorm(n, 0, sqrt(var_5(n))))
innov6 <- c(rnorm(n, 0, sqrt(var_6(n))))
innov7 <- c(rnorm(n, 0, sqrt(var_7(n))))
innov8 <- c(rnorm(n, 0, sqrt(var_8(n))))
innov9 <- c(rnorm(n, 0, sqrt(var_9(n))))

# Generate the observations
vecx <- cbind(as.vector(arima.sim(n = n, list(ar = 0.9), innov = innov1)),
              as.vector(arima.sim(n = n, list(ar = c(0, 0.2, 0.1, -0.1, 0.7)), 
              innov = innov2)),
              as.vector(arima.sim(n = n, list(ar = c(0.5, 0.3, -0.2, 0.1)), 
              innov = innov3)),
              as.vector(arima.sim(n = n, list(ma = -0.5), innov = innov4)),
              as.vector(arima.sim(n = n, list(ma = c(0.1, 0.1, 0.3, 0.5, 0.8)), 
              innov = innov5)),
              as.vector(arima.sim(n = n, list(ma = c(0.5, -0.5, 0.5)), innov = innov6)),
              as.vector(arima.sim(n = n, list(ar = c(-0.5, -0.3), ma = c(-0.2, 0.1)), 
              innov = innov7)),
              as.vector(arima.sim(n = n, list(ar = c(0, -0.1, -0.2, 0.5), ma = c(0, 0.1, 0.1, 0.6)),
              innov = innov8)),
              as.vector(arima.sim(n = n, list(ar = c(0.8), ma = c(0.7, 0.6, 0.5, 0.1)),
              innov = innov9)))


# Vector to tensor
tenx <- t(vecx)
dim(tenx) <- c(3, 3, n)


# Run TNSS-SD
res <- tNSS.SD(tenx)
res$W



