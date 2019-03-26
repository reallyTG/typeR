library(plyr)


### Name: failwith
### Title: Fail with specified value.
### Aliases: failwith
### Keywords: debugging

### ** Examples

f <- function(x) if (x == 1) stop("Error!") else 1
## Not run: 
##D f(1)
##D f(2)
## End(Not run)

safef <- failwith(NULL, f)
safef(1)
safef(2)



