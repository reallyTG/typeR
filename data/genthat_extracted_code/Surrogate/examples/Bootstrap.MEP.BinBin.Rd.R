library(Surrogate)


### Name: Bootstrap.MEP.BinBin
### Title: Bootstrap 95% CI around the maximum-entropy ICA and SPF
###   (surrogate predictive function)
### Aliases: Bootstrap.MEP.BinBin
### Keywords: Causal-Inference framework Counterfactuals BinBin Maximum
###   Entropy Bootstrap

### ** Examples

## Not run: 
##D  # time consuming code part
##D MEP_CI <- Bootstrap.MEP.BinBin(Data = Schizo_Bin, Surr = "BPRS_Bin", True = "PANSS_Bin",
##D                      Treat = "Treat", M = 500, Seed=123)
##D summary(MEP_CI)
## End(Not run)



