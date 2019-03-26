library(UsingR)


### Name: aosat
### Title: Artic Oscillation data based on SAT data
### Aliases: aosat
### Keywords: datasets

### ** Examples

data(aosat)
## Not run: 
##D library(zoo)
##D z = zoo(aosat[,2], order.by=aosat[,1])
##D plot(z)
##D ## yearly
##D plot(aggregate(z, floor(index(z)), mean))
##D ## decade-long means
##D plot(aggregate(z, 10*floor(index(z)/10), mean))
## End(Not run)



