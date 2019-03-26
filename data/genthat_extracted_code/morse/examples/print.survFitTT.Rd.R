library(morse)


### Name: print.survFitTT
### Title: Print of 'survFitTT' object
### Aliases: print.survFitTT
### Keywords: print

### ** Examples

# (1) Load the data
data(cadmium1)

# (2) Create an object of class 'survData'
cadmium1 <- survData(cadmium1)

## Not run: 
##D # (3) Run the survFitTT function with the log-logistic
##D # binomial model
##D out <- survFitTT(cadmium1, lcx = c(5, 10, 15, 20, 30, 50, 80),
##D                  quiet = TRUE)
##D 
##D # (4) Print the survFitTT object
##D print(out)
## End(Not run)




