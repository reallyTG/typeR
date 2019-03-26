library(scidb)


### Name: as.R
### Title: Download SciDB data to R
### Aliases: as.R

### ** Examples

## Not run: 
##D db <- scidbconnect()
##D x <- scidb(db, "build(<v:double>[i=1:5], sin(i))")
##D as.R(x)
##D ## i          v
##D ## 1  0.8414710
##D ## 2  0.9092974
##D ## 3  0.1411200
##D ## 4 -0.7568025
##D ## 5 -0.9589243
##D 
##D as.R(x, only_attributes=TRUE)
##D ##          v
##D ##  0.8414710
##D ##  0.9092974
##D ##  0.1411200
##D ## -0.7568025
##D ## -0.9589243
## End(Not run)



