library(Surrogate)


### Name: ICA.BinBin.Grid.Sample.Uncert
### Title: Assess surrogacy in the causal-inference single-trial setting in
###   the binary-binary case when monotonicity for S and T is assumed using
###   the grid-based sample approach, accounting for sampling variability
###   in the marginal pi.
### Aliases: ICA.BinBin.Grid.Sample.Uncert
### Keywords: Causal-Inference framework Counterfactuals Single-trial
###   setting Sensitivity ICA MarginalProbs

### ** Examples

# Compute R2_H given the marginals (sample from uniform), 
# assuming no monotonicity 
ICA_No2 <- ICA.BinBin.Grid.Sample.Uncert(pi1_1_=runif(10000, 0.3562, 0.4868),
pi0_1_=runif(10000, 0.0240, 0.0837), pi1_0_=runif(10000, 0.0240, 0.0837),
pi_1_1=runif(10000, 0.4434, 0.5742), pi_1_0=runif(10000, 0.0081, 0.0533),
pi_0_1=runif(10000, 0.0202, 0.0763), Seed=1, Monotonicity=c("No"), M=1000)

summary(ICA_No2)

# obtain plot of R2_H
plot(ICA_No2)



