library(dynamac)


### Name: dynardl
### Title: Estimate and Simulate ARDL Model
### Aliases: dynardl
### Keywords: ardl estimation simulation

### ** Examples

# Using the inequality data from dynamac
ardl.model <- dynardl(concern ~ incshare10 + urate, data = ineq, 
       lags = list("concern" = 1, "incshare10" = 1),
       diffs = c("incshare10", "urate"), 
       ec = TRUE, simulate = FALSE)
summary(ardl.model)

# Adding a lagged difference of the dependent variable
ardl.model.2 <- dynardl(concern ~ incshare10 + urate, data = ineq, 
       lags = list("concern" = 1, "incshare10" = 1),
       diffs = c("incshare10", "urate"), 
       lagdiffs = list("concern" = 1),
       ec = TRUE, simulate = FALSE)
summary(ardl.model.2)

# Does not work: levels and diffs must appear as a vector
## No test: 
ardl.model.3 <- dynardl(concern ~ incshare10 + urate, data = ineq, 
       lags = list("concern" = 1, "incshare10" = 1),
       levels = list("urate" = 1),
       diffs = list("incshare10" = 1, "urate" = 1), 
       lagdiffs = list("concern" = 1),
       ec = TRUE, simulate = FALSE)
## End(No test)

ardl.model.3 <- dynardl(concern ~ incshare10 + urate, data = ineq, 
       lags = list("concern" = 1, "incshare10" = 1),
       levels = c("urate"),
       diffs = c("incshare10", "urate"), 
       lagdiffs = list("concern" = 1),
       ec = TRUE, simulate = FALSE)



