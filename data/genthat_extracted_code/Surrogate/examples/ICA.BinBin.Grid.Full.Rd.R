library(Surrogate)


### Name: ICA.BinBin.Grid.Full
### Title: Assess surrogacy in the causal-inference single-trial setting in
###   the binary-binary case when monotonicity for S and T is assumed using
###   the full grid-based approach
### Aliases: ICA.BinBin.Grid.Full
### Keywords: Causal-Inference framework Counterfactuals Single-trial
###   setting Sensitivity ICA MarginalProbs

### ** Examples

## Not run: 
##D  # time consuming code part
##D # Compute R2_H given the marginals, 
##D # assuming monotonicity for S and T and grids
##D # pi_0111=seq(0, 1, by=.001) and 
##D # pi_1100=seq(0, 1, by=.001)
##D ICA <- ICA.BinBin.Grid.Full(pi1_1_=0.2619048, pi1_0_=0.2857143, pi_1_1=0.6372549, 
##D pi_1_0=0.07843137, pi0_1_=0.1349206, pi_0_1=0.127451,  
##D pi_0111=seq(0, 1, by=.01), pi_1100=seq(0, 1, by=.01), Seed=1)
##D 
##D # obtain plot of R2_H
##D plot(ICA, R2_H=TRUE)
## End(Not run)



