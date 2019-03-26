library(BTYD)


### Name: bgnbd.LL
### Title: BG/NBD Log-Likelihood
### Aliases: bgnbd.LL bgnbd.cbs.LL

### ** Examples

data(cdnowSummary)

cal.cbs <- cdnowSummary$cbs
# cal.cbs already has column names required by method

# random assignment of parameters
params <- c(0.5, 6, 1.2, 3.3)
# returns the log-likelihood of the given parameters
bgnbd.cbs.LL (params, cal.cbs)

# compare the speed and results to the following:
cal.cbs.compressed <- bgnbd.compress.cbs(cal.cbs)
bgnbd.cbs.LL (params, cal.cbs.compressed)

# Returns the log likelihood of the parameters for a customer who
# made 3 transactions in a calibration period that ended at t=6,
# with the last transaction occurring at t=4.
bgnbd.LL(params, x=3, t.x=4, T.cal=6)

# We can also give vectors as function parameters:
set.seed(7)
x <- sample(1:4, 10, replace = TRUE)
t.x <- sample(1:4, 10, replace = TRUE)
T.cal <- rep(4, 10)
bgnbd.LL(params, x, t.x, T.cal)



