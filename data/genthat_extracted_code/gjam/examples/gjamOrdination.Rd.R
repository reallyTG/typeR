library(gjam)


### Name: gjamOrdination
### Title: Ordinate gjam data
### Aliases: gjamOrdination

### ** Examples

## Not run: 
##D f      <- gjamSimData(S = 30, typeNames = 'CA') 
##D ml     <- list(ng = 30, burnin = 5, typeNames = f$typeNames, holdoutN = 10)
##D output <- gjam(f$formula, f$xdata, f$ydata, modelList = ml)
##D ePCA   <- gjamOrdination(output, PLOT=FALSE)
##D eNMDS  <- gjamOrdination(output, PLOT=FALSE, method='NMDS')
## End(Not run)



