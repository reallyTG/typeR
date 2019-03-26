library(LPWC)


### Name: comp.corr
### Title: Computing corr
### Aliases: comp.corr

### ** Examples

## This function computes the correlation after the lags (or shifts) have
## been computed.  In this example, the lags argument is randomly sampled
## for the sake of illustrating how prep.data() applies the lags and
## prepares a transformed dataset for comp.corr().
lagged <- prep.data(array(rnorm(30), c(3, 10)), timepoints = seq(0, 45, 5),
          lags = sample(c(0, 1, -1, 2, -2), size = 3))
comp.corr(data = lagged$data, time = lagged$time, C = 10)

## This example shows how comp.corr is used in practice with real data.
## The best.lag() function is called first to pre-compute the lags, which
## are passed to prep.data().
randdata <- array(rnorm(120), c(10, 12))
bl <- best.lag(data = randdata, timepoints = 1:12, C = 5)
lag.data <- prep.data(randdata, timepoints = 1:12, lags = bl)
comp.corr(lag.data$data, time = lag.data$time, C = 5)





