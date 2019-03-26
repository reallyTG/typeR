library(deflateBR)


### Name: deflate
### Title: Deflate Nominal Brazilian Reais Using Various Price Indexes
### Aliases: deflate

### ** Examples

## Not run: 
##D # Use IPCA index to deflate a vector of nominal Brazilian Reais
##D reais <- rep(100, 5)
##D actual_dates <- seq.Date(from = as.Date("2001-01-01"), to = as.Date("2001-05-01"), by = "month")
##D 
##D deflate(reais, actual_dates, "01/2018", "ipca")
##D 
##D # Using IGP-M index
##D deflate(reais, actual_dates, "01/2018", "igpm")
## End(Not run)




