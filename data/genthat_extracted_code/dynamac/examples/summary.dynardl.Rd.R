library(dynamac)


### Name: summary.dynardl
### Title: Enable summary calls to dynardl model objects.
### Aliases: summary.dynardl
### Keywords: utilities

### ** Examples

# Using the ineq data from dynamac
ardl.model <- dynardl(concern ~ incshare10 + urate, data = ineq, 
       lags = list("concern" = 1, "incshare10" = 1),
       diffs = c("incshare10", "urate"), 
       lagdiffs = list("concern" = 1),
       ec = TRUE, simulate = FALSE)
summary(ardl.model)



