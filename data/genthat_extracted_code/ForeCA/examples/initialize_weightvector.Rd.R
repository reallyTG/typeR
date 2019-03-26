library(ForeCA)


### Name: initialize_weightvector
### Title: Initialize weightvector for iterative ForeCA algorithms
### Aliases: initialize_weightvector
### Keywords: manip

### ** Examples

XX <- diff(log(EuStockMarkets))
## Not run: 
##D initialize_weightvector(U = XX, method = "SFA")
## End(Not run)
initialize_weightvector(num.series = ncol(XX), method = "rnorm")



