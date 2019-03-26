library(dynamac)


### Name: dynardl.auto.correlated
### Title: Run a variety of autocorrelation tests on the residuals from a
###   'dynardl' model.
### Aliases: dynardl.auto.correlated
### Keywords: utilities

### ** Examples

# Using the ineq data from dynamac
ardl.model <- dynardl(concern ~ incshare10 + urate, data = ineq, 
       lags = list("concern" = 1, "incshare10" = 1),
       diffs = c("incshare10", "urate"), 
       lagdiffs = list("concern" = 1),
       ec = TRUE, simulate = FALSE)
dynardl.auto.correlated(ardl.model)



