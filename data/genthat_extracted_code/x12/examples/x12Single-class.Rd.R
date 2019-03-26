library(x12)


### Name: x12Single-class
### Title: Class '"x12Single"'
### Aliases: x12Single-class x12Single
### Keywords: classes

### ** Examples

## Not run: 
##D s <- new("x12Single",ts=AirPassengers,tsName="air")
##D s <- setP(s,list(estimate=TRUE,regression.variables="AO1950.1",outlier.types="all",
##D   outlier.critical=list(LS=3.5,TC=2.5)))
##D s <- x12(s)
## End(Not run)



