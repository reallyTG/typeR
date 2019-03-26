library(Surrogate)


### Name: ICA.BinBin.Grid.Sample
### Title: Assess surrogacy in the causal-inference single-trial setting in
###   the binary-binary case when monotonicity for S and T is assumed using
###   the grid-based sample approach
### Aliases: ICA.BinBin.Grid.Sample
### Keywords: Causal-Inference framework Counterfactuals Single-trial
###   setting Sensitivity ICA MarginalProbs

### ** Examples

## Not run: 
##D  #time-consuming code parts
##D # Compute R2_H given the marginals, 
##D # assuming monotonicity for S and T and grids
##D # pi_0111=seq(0, 1, by=.001) and 
##D # pi_1100=seq(0, 1, by=.001)
##D ICA <- ICA.BinBin.Grid.Sample(pi1_1_=0.261, pi1_0_=0.285, 
##D pi_1_1=0.637, pi_1_0=0.078, pi0_1_=0.134, pi_0_1=0.127,  
##D Monotonicity=c("Surr.True.Endp"), M=2500, Seed=1)
##D 
##D # obtain plot of R2_H
##D plot(ICA, R2_H=TRUE)
## End(Not run)



