library(Surrogate)


### Name: plot Causal-Inference BinCont
### Title: Plots the (Meta-Analytic) Individual Causal Association and
###   related metrics when S is continuous and T is binary
### Aliases: 'plot Causal-Inference BinCont' plot.ICA.BinCont
### Keywords: Plot surrogacy Causal-Inference framework Single-trial
###   setting Sensitivity

### ** Examples

## Not run: 
##D # Time consuming code part
##D Fit <- ICA.BinCont(Dataset = Schizo, Surr = BPRS, True = PANSS_Bin, 
##D Treat=Treat, M=50, Seed=1)
##D 
##D summary(Fit)
##D plot(Fit)
## End(Not run)



