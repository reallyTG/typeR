library(Surrogate)


### Name: ICA.BinBin
### Title: Assess surrogacy in the causal-inference single-trial setting in
###   the binary-binary case
### Aliases: ICA.BinBin
### Keywords: Causal-Inference framework Counterfactuals Single-trial
###   setting Sensitivity ICA MarginalProbs

### ** Examples

## Not run: 
##D # Time consuming code part
##D # Compute R2_H given the marginals specified as the pi's, making no 
##D # assumptions regarding monotonicity (general case)
##D ICA <- ICA.BinBin(pi1_1_=0.2619048, pi1_0_=0.2857143, pi_1_1=0.6372549, 
##D pi_1_0=0.07843137, pi0_1_=0.1349206, pi_0_1=0.127451, Seed=1, 
##D Monotonicity=c("General"), Sum_Pi_f = seq(from=0.01, to=.99, by=.01), M=10000)
##D 
##D # obtain plot of the results
##D plot(ICA, R2_H=TRUE)
##D 
##D # Example 2 where the uncertainty in the estimation 
##D # of the marginals is taken into account
##D ICA_BINBIN2 <- ICA.BinBin(pi1_1_=runif(10000, 0.2573, 0.4252), 
##D pi1_0_=runif(10000, 0.1769, 0.3310), 
##D pi_1_1=runif(10000, 0.5947, 0.7779), 
##D pi_1_0=runif(10000, 0.0322, 0.1442), 
##D pi0_1_=runif(10000, 0.0617, 0.1764), 
##D pi_0_1=runif(10000, 0.0254, 0.1315),
##D Monotonicity=c("General"), 
##D Sum_Pi_f = seq(from=0.01, to=0.99, by=.01), 
##D M=50000, Seed=1)
##D 
##D # Plot results
##D plot(ICA_BINBIN2)
## End(Not run)



