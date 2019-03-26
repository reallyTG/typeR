library(furniture)


### Name: tableF
### Title: Frequency Table
### Aliases: tableF

### ** Examples


## Not run: 
##D 
##D library(furniture)
##D 
##D data <- data.frame(
##D   x = sample(c(1,2,3,4), 100, replace=TRUE),
##D   y = rnorm(100)
##D )
##D 
##D ## Basic Use
##D tableF(data, x)
##D tableF(data, y)
##D 
##D ## Adjust the number of items shown
##D tableF(data, y, n = 10)
##D 
##D ## Add splitby
##D tableF(data, x, splitby = y)
##D 
## End(Not run)




