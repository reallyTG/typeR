library(mfGARCH)


### Name: fit_mfgarch
### Title: This function estimates a multiplicative mixed-frequency GARCH
###   model. For the sake of numerical stability, it is best to multiply
###   log returns by 100.
### Aliases: fit_mfgarch
### Keywords: fit_mfgarch

### ** Examples

## Not run: 
##D fit_mfgarch(data = df_financial, y = "return", x = "nfci", low.freq = "week", K = 52)
##D fit_mfgarch(data = df_mfgarch, y = "return", x = "nfci", low.freq = "year_week", K = 52,
##D x.two = "dindpro", K.two = 12, low.freq.two = "year_month", weighting.two = "beta.restricted")
## End(Not run)



