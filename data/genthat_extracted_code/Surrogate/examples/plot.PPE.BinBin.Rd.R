library(Surrogate)


### Name: plot.PPE.BinBin
### Title: Plots the distribution of either PPE, RPE or R^2_{H} either as a
###   density or as a histogram in the setting where both S and T are
###   binary endpoints
### Aliases: plot.PPE.BinBin
### Keywords: Causal-Inference framework Counterfactuals Single-trial
###   setting ICA PPE

### ** Examples

## Not run: 
##D # Time consuming part
##D PANSS <- PPE.BinBin(pi1_1_=0.4215, pi0_1_=0.0538, pi1_0_=0.0538,
##D                    pi_1_1=0.5088, pi_1_0=0.0307,pi_0_1=0.0482, 
##D                    Seed=1, M=2500) 
##D                    
##D plot(PANSS,Type="Freq",Param="RPE",color="grey",Breaks=0.05,xlimits=c(0,1),main="PANSS")
## End(Not run)



