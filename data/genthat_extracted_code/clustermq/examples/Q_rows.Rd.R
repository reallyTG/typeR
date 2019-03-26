library(clustermq)


### Name: Q_rows
### Title: Queue function calls defined by rows in a data.frame
### Aliases: Q_rows

### ** Examples

## Not run: 
##D # Run a simple multiplication for data frame columns x and y on a worker node
##D fx = function (x, y) x * y
##D df = data.frame(x = 5, y = 10)
##D Q_rows(df, fx, job_size = 1)
##D # [1] 50
##D 
##D # Q_rows also matches the names of a data frame with the function arguments
##D fx = function (x, y) x - y
##D df = data.frame(y = 5, x = 10)
##D Q_rows(df, fx, job_size = 1)
##D # [1] 5
## End(Not run)



