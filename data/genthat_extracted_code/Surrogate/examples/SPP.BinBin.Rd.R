library(Surrogate)


### Name: SPF.BinBin
### Title: Evaluate the surrogate predictive function (SPF) in the
###   binary-binary setting (sensitivity-analysis based approach)
### Aliases: SPF.BinBin
### Keywords: Causal-Inference framework Counterfactuals BinBin Sensitivity
###   SPF

### ** Examples

# Use ICA.BinBin.Grid.Sample to obtain plausible values for pi
ICA_BINBIN_Grid_Sample <- ICA.BinBin.Grid.Sample(pi1_1_=0.341, pi0_1_=0.119,
pi1_0_=0.254, pi_1_1=0.686, pi_1_0=0.088, pi_0_1=0.078, Seed=1,
Monotonicity=c("General"), M=2500)

# Obtain SPF
SPF <- SPF.BinBin(ICA_BINBIN_Grid_Sample)

# examine results
summary(SPF)
plot(SPF)



