library(deflateBR)


### Name: igpdi
### Title: Deflate Nominal Brazilian Reais Using IGP-DI
### Aliases: igpdi

### ** Examples

## Not run: 
##D # Use IGP-DI index to deflate a vector of nominal Brazilian Reais
##D reais <- rep(100, 5)
##D actual_dates <- seq.Date(from = as.Date("2001-01-01"), to = as.Date("2001-05-01"), by = "month")
##D 
##D igpdi(reais, actual_dates, "01/2018")
## End(Not run)




