library(cthreshER)


### Name: cterFit
### Title: Fit the continuous threshold expectile regression
### Aliases: cterFit
### Keywords: cterFit

### ** Examples



## simulated data
ptm <- proc.time()
n <- 200
t0 <- 1.5
bet0 <- c(1, 3, -2, 1)
tau <- 0.3
modtype <- 1
errtype <- 1
dat <- cterSimData(n, bet0, t0, tau, modtype, errtype)
y <- dat[, 1]
x <- dat[, 2]
z <- dat[, 3]
fit <- cterFit(y, x, z, tau)

## The example of Baseball pitcher salary
data(data_bbsalaries)
y <- data_bbsalaries$y
x <- data_bbsalaries$x
z <- NULL
tau <- 0.5
fit <- cterFit(y, x, z, tau)
proc.time() - ptm



