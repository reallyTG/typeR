library(Surrogate)


### Name: ICA.BinCont
### Title: Assess surrogacy in the causal-inference single-trial setting in
###   the binary-continuous case
### Aliases: ICA.BinCont
### Keywords: Causal-Inference framework Counterfactuals Single-trial
###   setting Sensitivity ICA Continuous endpoint Binary endpoint

### ** Examples

## Not run: 
##D # Time consuming code part
##D data(Schizo)
##D Fit <- ICA.BinCont(Dataset = Schizo, Surr = BPRS, True = PANSS_Bin, 
##D Treat=Treat, M=50, Seed=1)
##D 
##D summary(Fit)
##D plot(Fit)
## End(Not run)



