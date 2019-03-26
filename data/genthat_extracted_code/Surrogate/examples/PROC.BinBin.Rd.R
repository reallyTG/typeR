library(Surrogate)


### Name: PROC.BinBin
### Title: Evaluate the individual causal association (ICA) and reduction
###   in probability of a prediction error (RPE) in the setting where both
###   S and T are binary endpoints
### Aliases: PROC.BinBin
### Keywords: Causal-Inference framework Counterfactuals Single-trial
###   setting ICA RPE PPE

### ** Examples

# Conduct the analysis 
 
## Not run: 
##D  # time consuming code part
##D library(Surrogate)
##D # load the CIGTS data 
##D data(CIGTS)
##D CIGTS_25000<-PROC.BinBin(Dataset=CIGTS, Surr=IOP_12, True=IOP_96, 
##D Treat=Treat, BS=FALSE,seqs=250, MC_samples=100, Seed=1)
## End(Not run)




