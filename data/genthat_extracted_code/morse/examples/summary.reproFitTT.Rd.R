library(morse)


### Name: summary.reproFitTT
### Title: Summary of 'reproFitTT' object
### Aliases: summary.reproFitTT
### Keywords: summary

### ** Examples

# (1) Load the data
data(cadmium1)

# (2) Create a reproData object
cadmium1 <- reproData(cadmium1)

## Not run: 
##D # (3) Run the reproFitTT function with the log-logistic
##D # model
##D out <- reproFitTT(cadmium1, ecx = c(5, 10, 15, 20, 30, 50, 80),
##D quiet = TRUE)
##D 
##D # (4) summarize the reproFitTT object
##D summary(out)
## End(Not run)




