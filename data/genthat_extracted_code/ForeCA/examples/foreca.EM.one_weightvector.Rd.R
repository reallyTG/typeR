library(ForeCA)


### Name: foreca.EM.one_weightvector
### Title: EM-like algorithm to estimate optimal ForeCA transformation
### Aliases: foreca.EM.one_weightvector
### Keywords: iteration manip optimize

### ** Examples

## Not run: 
##D XX <- diff(log(EuStockMarkets)[100:200,]) * 100
##D one.weight <- foreca.EM.one_weightvector(whiten(XX)$U, 
##D                                          spectrum.control = 
##D                                             list(method = "wosa"))
## End(Not run)




