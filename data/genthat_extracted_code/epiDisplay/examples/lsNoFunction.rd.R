library(epiDisplay)


### Name: List non-function objects
### Title: List non-function objects
### Aliases: lsNoFunction
### Keywords: database

### ** Examples

object1 <- 1:5
object2 <- list(a=3, b=5)
function1 <- function(x) {x^3 +1}
ls() 
lsNoFunction()

## To show only functions
as.character(lsf.str()[])



