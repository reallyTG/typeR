library(artfima)


### Name: best_glp_models
### Title: Best AIC/BIC Models for Specified GLP
### Aliases: best_glp_models
### Keywords: ts

### ** Examples

## Not run: 
##D #takes about 4 minutes. Checking result for bestmodels()
##D z<-tseg(1000, "BJARMA11")
##D ansARIMA <- best_glp_models(z, glp = "ARIMA", p=2, q=2)
##D ansARFIMA <- best_glp_models(z, glp = "ARFIMA", p=2, q=2)
##D ansARTFIMA <- best_glp_models(z, glp = "ARTFIMA", p=2, q=2)
##D ansARIMA$bic$bic
##D ansARFIMA$bic$bic
##D ansARTFIMA$bic$bic
##D bestModels(z)
## End(Not run)



