library(dynamac)


### Name: pssbounds
### Title: Perform Pesaran, Shin and Smith (2001) cointegration test
### Aliases: pssbounds
### Keywords: cointegration

### ** Examples

# Using the ineq data from dynamac
# We can get all the values by hand
ardl.model <- dynardl(concern ~ incshare10 + urate, data = ineq, 
        lags = list("concern" = 1, "incshare10" = 1),
        diffs = c("incshare10", "urate"), 
        lagdiffs = list("concern" = 1),
       ec = TRUE, simulate = FALSE)
summary(ardl.model)
pssbounds(obs = 47, fstat = 7.01578, tstat = -3.223, case = 3, k = 1)

# Or just pass a dynardl model.
pssbounds(ardl.model)



