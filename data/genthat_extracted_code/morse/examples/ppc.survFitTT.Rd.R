library(morse)


### Name: ppc.survFitTT
### Title: Posterior predictive check plot for 'survFitTT' objects
### Aliases: ppc.survFitTT

### ** Examples


# (1) Load the data
data(cadmium1)

# (2) Create an object of class "survData"
dat <- survData(cadmium1)

## Not run: 
##D # (3) Run the survFitTT function with the log-logistic binomial model
##D out <- survFitTT(dat, lcx = c(5, 10, 15, 20, 30, 50, 80),
##D quiet = TRUE)
##D 
##D # (4) Plot observed versus predicted values
##D ppc(out)
## End(Not run)




