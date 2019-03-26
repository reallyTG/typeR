library(Surrogate)


### Name: CausalDiagramBinBin
### Title: Draws a causal diagram depicting the median informational
###   coefficients of correlation (or odds ratios) between the
###   counterfactuals for a specified range of values of the ICA in the
###   binary-binary setting.
### Aliases: CausalDiagramBinBin
### Keywords: Plot surrogacy Causal-Inference framework Single-trial
###   setting

### ** Examples

# Compute R2_H given the marginals specified as the pi's
ICA <- ICA.BinBin.Grid.Sample(pi1_1_=0.2619048, pi1_0_=0.2857143, 
pi_1_1=0.6372549, pi_1_0=0.07843137, pi0_1_=0.1349206, pi_0_1=0.127451,
Seed=1, Monotonicity=c("General"), M=1000)

# Obtain a causal diagram that provides the medians of the 
# correlations between the counterfactuals for the range
# of R2_H values between 0.1 and 1
   # Assume no monotonicty 
CausalDiagramBinBin(x=ICA, Min=0.1, Max=1, Monotonicity="No") 

   # Assume monotonicty for S 
CausalDiagramBinBin(x=ICA, Min=0.1, Max=1, Monotonicity="Surr.Endp") 

# Now only consider the results that were obtained when 
# monotonicity was assumed for the true endpoint
CausalDiagramBinBin(x=ICA, Values="ORs", Theta_T0S0=2.156, Theta_T1S1=10, 
Min=0, Max=1,  Monotonicity="True.Endp") 



