library(cthreshER)


### Name: cterTest
### Title: test the existence of change point in the continuous threshold
###   expectile regression
### Aliases: cterTest
### Keywords: cterTest

### ** Examples


## simulated data
ptm <- proc.time()
set.seed(1)
n <- 200
t0 <- 1.5
bet0 <- c(1, 3, 0, 1)
tau <- 0.3
modtype <- 1
errtype <- 1
dat <- cterSimData(n, bet0, t0, tau, modtype, errtype)
y <- dat[, 1]
x <- dat[, 2]
z <- dat[, 3]
fit.test <- cterTest(y, x, z, tau, NB = 30)
fit.test$p.value

## The example of Baseball pitcher salary
data(data_bbsalaries)
y <- data_bbsalaries$y
x <- data_bbsalaries$x
z <- NULL
tau <- 0.5
fit.test <- cterTest(y, x, z, tau, NB = 30)
fit.test$p.value
proc.time() - ptm



