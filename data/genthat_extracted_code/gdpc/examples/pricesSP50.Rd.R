library(gdpc)


### Name: pricesSP50
### Title: Stock Prices of the First 50 Components of S&P500
### Aliases: pricesSP50
### Keywords: datasets

### ** Examples

data(pricesSP50)
## Not run: 
##D #Plot the first four series
##D plot(pricesSP50[, 1:4], main = 'Four components of the S&P500 index')
##D #Compute GDPCs; this may take a bit.
##D fit_SP <- auto.gdpc(pricesSP50, normalize = 2, niter_max = 1000, ncores= 4)
##D fit_SP
##D #Get reconstruction and plot
##D recons <- fitted(fit_SP, num_comp = 2)
##D colnames(recons) <- colnames(pricesSP50)
##D plot(recons[, 1:4], main = 'Reconstruction of four components of the S&P500 index')
## End(Not run)



