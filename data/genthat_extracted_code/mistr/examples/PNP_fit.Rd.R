library(mistr)


### Name: PNP_fit
### Title: Fitting a Pareto-Normal-Pareto Model
### Aliases: PNP_fit

### ** Examples

## Not run: 
##D  PNP_fit(stocks$SAP)
##D 
##D  PNP_fit(stocks$MSFT)
##D 
##D  autoplot(PNP_fit(stocks$ADS))
##D 
##D  PNP_fit(stocks$GSPC, method = "BFGS")
##D 
##D  PNP_fit(stocks$DJI, start = c(-0.01,0.01,0,0.008))
##D 
## End(Not run)



