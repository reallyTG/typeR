library(VGAM)


### Name: AR1EIM
### Title: Computation of the Exact EIM of an Order-1 Autoregressive
###   Process
### Aliases: AR1EIM

### ** Examples

  set.seed(1)
  nn <- 500
  ARcoeff1 <- c(0.3, 0.25)        # Will be recycled.
  WNsd     <- c(exp(1), exp(1.5)) # Will be recycled.
  p.drift  <- c(0, 0)             # Zero-mean gaussian time series.

  ### Generate two (zero-mean) AR(1) processes ###
  ts1 <- p.drift[1]/(1 - ARcoeff1[1]) +
                   arima.sim(model = list(ar = ARcoeff1[1]), n = nn,
                   sd = WNsd[1])
  ts2 <- p.drift[2]/(1 - ARcoeff1[2]) +
                   arima.sim(model = list(ar = ARcoeff1[2]), n = nn,
                   sd = WNsd[2])

  ARdata <- matrix(cbind(ts1, ts2), ncol = 2)


  ### Compute the exact EIMs: TWO responses. ###
  ExactEIM <- AR1EIM(x = ARdata, var.arg = FALSE, p.drift = p.drift,
                           WNsd = WNsd, ARcoeff1 = ARcoeff1)

  ### For response 1:
  head(ExactEIM[, 1 ,])      # NOTICE THAT THIS IS A (nn x 6) MATRIX!

  ### For response 2:
  head(ExactEIM[, 2 ,])      # NOTICE THAT THIS IS A (nn x 6) MATRIX!



