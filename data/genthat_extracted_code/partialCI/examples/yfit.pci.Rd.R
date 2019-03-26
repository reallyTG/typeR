library(partialCI)


### Name: yfit.pci
### Title: Fetch series from Yahoo and perform a partial cointegration fit.
### Aliases: yfit.pci
### Keywords: ts models

### ** Examples

# Compare a cointegration fit Coca-Cola and Pepsi to a partial cointegration fit.
# Note that yegcm(X, Y) has a different parameter ordering than yfit.pci(Y, X)
# yegcm("PEP", "KO", start=as.numeric(format(Sys.Date() - 365*2, "%Y%m%d")))
# yfit.pci("KO", "PEP")



