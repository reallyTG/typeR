library(gdpc)


### Name: ipi91
### Title: Industrial Production Index (IPI) of France, Germany, Italy,
###   United Kingdom, USA and Japan
### Aliases: ipi91
### Keywords: datasets

### ** Examples

data(ipi91)
plot(ipi91, plot.type = 'multiple', main = 'Industrial Production Index')
## Not run: 
##D #Compute first GDPC with nine lags; this may take a bit.
##D gdpc_ipi <- gdpc(ipi91, 9, niter_max = 1500)
##D #Plot the component
##D plot(gdpc_ipi, which = 'Component', ylab = '')
##D #Get reconstruction of the time series and plot
##D recons <- fitted(gdpc_ipi)
##D colnames(recons) <- colnames(ipi91)
##D plot(recons, main = 'Fitted values')
## End(Not run)



