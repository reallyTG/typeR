library(deflateBR)


### Name: igpm
### Title: Deflate Nominal Brazilian Reais Using IGP-M
### Aliases: igpm

### ** Examples

## Not run: 
##D # Use IGP-M index to deflate a vector of nominal Brazilian Reais
##D reais <- rep(100, 5)
##D actual_dates <- seq.Date(from = as.Date("2001-01-01"), to = as.Date("2001-05-01"), by = "month")
##D 
##D igpm(reais, actual_dates, "01/2018")
## End(Not run)




