library(Surrogate)


### Name: plot SPF BinCont
### Title: Plots the surrogate predictive function (SPF) in the
###   binary-continuous setting.
### Aliases: 'plot SPF BinCont' plot.SPF.BinCont
### Keywords: Plot SPF Causal-Inference framework Sensitivity BinCont

### ** Examples

## Not run: 
##D  # time consuming code part
##D data(Schizo_BinCont)
##D # Use ICA.BinCont to examine surrogacy
##D Result_BinCont <- ICA.BinCont(M = 1000, Dataset = Schizo_BinCont,
##D Surr = PANSS, True = CGI_Bin, Treat=Treat, Diff.Sigma=TRUE)
##D 
##D # Obtain SPF
##D Fit <- SPF.BinCont(x=Result_BinCont, a = -30, b = -3)
##D 
##D # examine results
##D summary(Fit1)
##D plot(Fit1)
##D 
##D plot(Fit1, Type="Most.Likely.DeltaT")
## End(Not run)



