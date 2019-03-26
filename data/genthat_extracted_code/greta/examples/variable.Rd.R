library(greta)


### Name: variable
### Title: create greta variables
### Aliases: variable

### ** Examples

## Not run: 
##D 
##D # a scalar variable
##D a <- variable()
##D 
##D # a positive length-three variable
##D b <- variable(lower = 0, dim = 3)
##D 
##D # a 2x2x2 variable bounded between 0 and 1
##D c <- variable(lower = 0, upper = 1, dim = c(2, 2, 2))
##D 
##D # create a variable, with lower and upper defined by greta arrays
##D min <- as_data(iris$Sepal.Length)
##D max <- min ^ 2
##D d <- min + variable(0, 1, dim = nrow(iris)) * (max - min)
## End(Not run)



