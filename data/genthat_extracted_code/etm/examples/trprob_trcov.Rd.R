library(etm)


### Name: trprob.etm
### Title: Function to extract transition probabilities and (co)variance
### Aliases: trprob.etm trprob trcov trcov.etm
### Keywords: methods

### ** Examples

data(sir.cont)

# Modification for patients entering and leaving a state
# at the same date
# Change on ventilation status is considered
# to happen before end of hospital stay
sir.cont <- sir.cont[order(sir.cont$id, sir.cont$time), ]
for (i in 2:nrow(sir.cont)) {
  if (sir.cont$id[i]==sir.cont$id[i-1]) {
    if (sir.cont$time[i]==sir.cont$time[i-1]) {
      sir.cont$time[i-1] <- sir.cont$time[i-1] - 0.5
    }
  }
}

### Computation of the transition probabilities
# Possible transitions.
tra <- matrix(ncol=3,nrow=3,FALSE)
tra[1, 2:3] <- TRUE
tra[2, c(1, 3)] <- TRUE

# etm
fit.etm <- etm(sir.cont, c("0", "1", "2"), tra, "cens", 0)

## extract P_01(0, t) and variance
p01 <- trprob(fit.etm, "0 1")
var.p01 <- trcov(fit.etm, "0 1")

## covariance between P_00 and P_01
cov.00.01 <- trcov(fit.etm, c("0 0", "0 1"))

## P_01 at some time points
trprob(fit.etm, "0 1", c(0, 15, 50, 100))



