library(Surrogate)


### Name: SPF.BinCont
### Title: Evaluate the surrogate predictive function (SPF) in the
###   binary-continuous setting (sensitivity-analysis based approach)
### Aliases: SPF.BinCont
### Keywords: Causal-Inference framework Counterfactuals BinCont
###   Sensitivity SPF

### ** Examples

## Not run: 
##D  # time consuming code part
##D # Use ICA.BinCont to examine surrogacy
##D data(Schizo_BinCont)
##D Result_BinCont <- ICA.BinCont(M = 1000, Dataset = Schizo_BinCont,
##D Surr = PANSS, True = CGI_Bin, Treat=Treat, Diff.Sigma=TRUE)
##D 
##D # Obtain SPF
##D Fit <- SPF.BinCont(x=Result_BinCont, a = -30, b = -3)
##D 
##D # examine results
##D summary(Fit1)
##D plot(Fit1)
## End(Not run)



