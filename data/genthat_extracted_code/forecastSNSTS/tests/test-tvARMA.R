context("tvARMA")


# In this file we compute the simulated tvARMA time series
# naively (with plain R) and compare to the C++ implementation
# which is more efficient.

.tvARMA_naive <- function(T = 128, a = list(),
    b = list(),
    sigma = function(u) {return(1)},
    innov = function(n) {rnorm(n, 0, 1)} ) {
  p <- length(a)
  q <- length(b)
  z <- c()
  x <- c()
  z <- innov(T+q)
  x[1:max(p,q)] <- innov(max(p,q)) ## Warm up a stationary ARMA(p,q) with a(0) and b(0)?
  for(i in (max(p,q)+1):T) {
    x[i] <- sigma(i/T) * z[q+i]
    if (q > 0) {
      for (j in 1:q) {
        x[i] <- x[i] + b[[j]](i/T) * sigma((i-j)/T) * z[q+i-j]
      }
    }
    if (p > 0) {
      for (j in 1:p) {
        x[i] <- x[i] + a[[j]](i/T)*x[i-j]
      }
    }
  }
  return(x)
}

# We will do it for the tvAR1 time series defined in Dahlhaus (AoS, 1997)

a1 <- function(u) {1.8 * cos(1.5 - cos(4*pi*u))}
a2 <- function(u) {-0.81}

set.seed(2581)
X_naive <- .tvARMA_naive(10, a=list(a1, a2), b=list())
set.seed(2581)
X_Cpp   <- tvARMA(10, a=list(a1, a2), b=list())

test_that("tvAR(2) computation works", {
  expect_equal(sum( (X_naive - X_Cpp)^2 ), 0)
})

set.seed(2581)
X_naive <- .tvARMA_naive(10, a=list(a1), b=list(a2))
set.seed(2581)
X_Cpp   <- tvARMA(10, a=list(a1), b=list(a2))


test_that("tvARMA(1,1) computation works", {
      expect_equal(sum( (X_naive - X_Cpp)^2 ), 0)
    })

set.seed(2581)
X_naive <- .tvARMA_naive(100, a=list(), b=list(a1,a2))
set.seed(2581)
X_Cpp   <- tvARMA(100, a=list(), b=list(a1,a2))


test_that("tvMA(2) computation works", {
      expect_equal(sum( (X_naive - X_Cpp)^2 ), 0)
    })

set.seed(2581)
X_naive <- .tvARMA_naive(10, a=list(), b=list(), sigma=function(u){1+2*u})
set.seed(2581)
X_Cpp   <- tvARMA(10, a=list(), b=list(), sigma=function(u){1+2*u})


test_that("tvARMA(0,0) with heteroscedasticity computation works", {
      expect_equal(sum( (X_naive - X_Cpp)^2 ), 0)
    })

set.seed(2581)
X_naive <- rt(10, df=1)
set.seed(2581)
X_Cpp   <- tvARMA(10, a=list(), b=list(), innov=function(n){rt(n, df=1)})


test_that("iid with t_1 distr innovations works", {
      expect_equal(sum( (X_naive - X_Cpp)^2 ), 0)
    })