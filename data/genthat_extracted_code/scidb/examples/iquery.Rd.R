library(scidb)


### Name: iquery
### Title: Run a SciDB query, optionally returning the result.
### Aliases: iquery

### ** Examples

## Not run: 
##D db <- scidbconnect()
##D iquery(db, "build(<v:double>[i=1:5], sin(i))", return=TRUE)
##D ## i          v
##D ## 1  0.8414710
##D ## 2  0.9092974
##D ## 3  0.1411200
##D ## 4 -0.7568025
##D ## 5 -0.9589243
##D 
##D # Use binary=FALSE and additional options to read.table function:
##D iquery(db, "build(<val:string>[i=1:3], '[(01),(02),(03)]', true)",xi
##D        return=TRUE, binary=FALSE, colClasses=c("integer", "character"))
##D ##   i val
##D ## 1 1  01
##D ## 2 2  02
##D ## 3 3  03
## End(Not run)



