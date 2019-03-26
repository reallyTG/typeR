library(morse)


### Name: print.reproFitTT
### Title: Print of 'reproFitTT' object
### Aliases: print.reproFitTT
### Keywords: print

### ** Examples

# (1) Load the data
data(cadmium1)

# (2) Create an object of class 'reproData'
cadmium1 <- reproData(cadmium1)

## Not run: 
##D # (3) Run the reproFitTT function with the log-logistic
##D # model
##D out <- reproFitTT(cadmium1, ecx = c(5, 10, 15, 20, 30, 50, 80),
##D quiet = TRUE)
##D 
##D # (4) Print the reproFitTT object
##D print(out)
## End(Not run)




