library(nowcasting)


### Name: month2qtr
### Title: Monthly to quarterly transformation
### Aliases: month2qtr

### ** Examples

 ## Not run: 
##D # Selecting only the last month of time series IPCA:
##D month2qtr(BRGDP$base[,"IPCA"], reference_month = 3)
##D 
##D # Selecting only the first month of time series IPCA:
##D month2qtr(BRGDP$base[,"IPCA"], reference_month = 1)
## End(Not run)



