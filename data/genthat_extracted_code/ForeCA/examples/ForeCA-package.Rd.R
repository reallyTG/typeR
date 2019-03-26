library(ForeCA)


### Name: ForeCA-package
### Title: Implementation of Forecastable Component Analysis (ForeCA)
### Aliases: ForeCA ForeCA-package
### Keywords: package

### ** Examples

XX <- ts(diff(log(EuStockMarkets)))
Omega(XX)

plot(log10(lynx))
Omega(log10(lynx))

## Not run: 
##D ff <- foreca(XX, n.comp = 4)
##D ff
##D plot(ff)
##D summary(ff)
## End(Not run)




