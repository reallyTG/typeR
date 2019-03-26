library(xts)
library(zoo)

context("Test on ldhmm")

eps <- 0.001 # default tolerance of error for real number
eps5 <- 0.00001 # high precision

m <- 3
param0 <- matrix(
          c(0.003, 0.02, 1,
           -0.003, 0.03, 1.1,
           -0.006, 0.03, 1.3), m, 3, byrow=TRUE)
gamma0 <- matrix(
          c(0.98, 0.019, 0.001,
            0.03, 0.96, 0.01,
            0.001, 0.109, 0.89), m, m, byrow=TRUE)
delta0 <- c(0.596, 0.367, 0.037)

h <- ldhmm(m=m, param=param0, gamma=gamma0, delta=delta0)

test_that("test n2w and w2n",{
    v <- ldhmm.n2w(h)
    p <- ldhmm.w2n(h, v)
    e1  = abs(h@m - p@m) 
    e2 = sum(abs(h@param - p@param))
    e3 = sum(abs(as.vector(h@gamma - p@gamma)))
    expect_true(e1+e2+e3 <= eps5)
})

spx <- ldhmm.ts_log_rtn() # weekly

test_that("test SPX first weekly return in 1950",{
    r <- log(16.67/16.98)
    expect_true(abs(head(spx$x,1)/r-1) <= eps)
})

test_that("test SPX last weekly return in 2015",{
    r <- log(2043.94/2060.99)
    expect_true(abs(tail(spx$x,1)/r-1) <= eps)
})

test_that("test SPX first two ACF",{
    a1 <- ldhmm.ts_abs_acf(spx$x, lag.max=2)
    a2 <- c(0.2505695,  0.1946469)
    e = max(abs(a1/a2-1))
    expect_true(e <= eps)
})

test_that("test SPX first two ACF with drop=1",{
    a1 <- ldhmm.ts_abs_acf(spx$x, drop=1, lag.max=2)
    a2 <- c(0.2354366,  0.1880674)
    e = max(abs(a1/a2-1))
    expect_true(e <= eps)
})

hss <- ldhmm.decoding(h, spx$x)
st0 <- ldhmm.decode_stats_history(hss, 0)
stma <- ldhmm.decode_stats_history(hss, 10)

test_that("test SPX stats ma on vol (head)",{
    a1 <- mean(head(st0[,2],10))
    a2 <- stma[10,2]
    e = max(abs(a1/a2-1))
    expect_true(e <= eps)
})

test_that("test SPX stats ma on vol (tail)",{
    a1 <- mean(tail(st0[,2],10))
    a2 <- tail(stma[,2],1)
    e = max(abs(a1/a2-1))
    expect_true(e <= eps)
})

# test SMA
test_that("test sma utility",{
    a <- ldhmm.sma(1:100, order=10)
    a1 <- mean(1:10)
    a2 <- mean(91:100)
    e1 = abs(a1/a[10]-1)
    e2 = abs(a2/a[100]-1)
    expect_true(max(c(e1,e2)) <= eps)
})



