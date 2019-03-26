library(morse)


### Name: survFitTT.survDataCstExp
### Title: Fits a Bayesian concentration-response model for target-time
###   survival analysis
### Aliases: survFitTT.survDataCstExp
### Keywords: estimation

### ** Examples


# (1) Load the data
data(cadmium1)

# (2) Create an object of class "survData"
dat <- survData(cadmium1)

## Not run: 
##D # (3) Run the survFitTT function with the log-logistic
##D #     binomial model
##D out <- survFitTT(dat, lcx = c(5, 10, 15, 20, 30, 50, 80),
##D                  quiet = TRUE)
## End(Not run)




