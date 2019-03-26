library(morse)


### Name: summary.survFitTT
### Title: Summary of 'survFitTT' object
### Aliases: summary.survFitTT
### Keywords: summary

### ** Examples

# (1) Load the data
data(cadmium1)

# (2) Create a survData object
cadmium1 <- survData(cadmium1)

## Not run: 
##D # (3) Run the survFitTT function with the log-logistic
##D # binomial model
##D out <- survFitTT(cadmium1, lcx = c(5, 10, 15, 20, 30, 50, 80),
##D                  quiet = TRUE)
##D 
##D # (4) summarize the survFitTT object
##D summary(out)
## End(Not run)




