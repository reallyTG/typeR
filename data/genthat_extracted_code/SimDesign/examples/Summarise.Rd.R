library(SimDesign)


### Name: Summarise
### Title: Summarise simulated data using various population comparison
###   statistics
### Aliases: Summarise

### ** Examples

## Not run: 
##D 
##D mysummarise <- function(condition, results, fixed_objects = NULL){
##D 
##D     #find results of interest here (alpha < .1, .05, .01)
##D     lessthan.05 <- EDR(results, alpha = .05)
##D 
##D     # return the results that will be appended to the design input
##D     ret <- c(lessthan.05=lessthan.05)
##D     ret
##D }
##D 
## End(Not run)




