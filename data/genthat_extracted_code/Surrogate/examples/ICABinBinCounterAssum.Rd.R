library(Surrogate)


### Name: ICA.BinBin.CounterAssum
### Title: ICA (binary-binary setting) that is obtaied when the
###   counterfactual correlations are assumed to fall within some
###   prespecified ranges.
### Aliases: ICA.BinBin.CounterAssum
### Keywords: Plot surrogacy Causal-Inference framework Single-trial
###   setting

### ** Examples

## Not run: 
##D  #Time consuming (>5 sec) code part
##D # Compute R2_H given the marginals specified as the pi's, making no 
##D # assumptions regarding monotonicity (general case)
##D ICA <- ICA.BinBin.Grid.Sample(pi1_1_=0.261, pi1_0_=0.285, 
##D pi_1_1=0.637, pi_1_0=0.078, pi0_1_=0.134, pi_0_1=0.127,  
##D Monotonicity=c("General"), M=5000, Seed=1)
##D 
##D # Obtain a density plot of R2_H, assuming that 
##D # r2_h_S0S1>=.2, r2_h_S0T1>=0, r2_h_T0T1>=.2, and r2_h_T0S1>=0
##D ICA.BinBin.CounterAssum(ICA, r2_h_S0S1_min=.2, r2_h_S0S1_max=1, 
##D r2_h_S0T1_min=0, r2_h_S0T1_max=1, r2_h_T0T1_min=0.2, r2_h_T0T1_max=1, 
##D r2_h_T0S1_min=0, r2_h_T0S1_max=1, Monotonicity="General",
##D Type="Density") 
##D 
##D # Now show the densities of R2_H under the different 
##D # monotonicity assumptions 
##D ICA.BinBin.CounterAssum(ICA, r2_h_S0S1_min=.2, r2_h_S0S1_max=1, 
##D r2_h_S0T1_min=0, r2_h_S0T1_max=1, r2_h_T0T1_min=0.2, r2_h_T0T1_max=1, 
##D r2_h_T0S1_min=0, r2_h_T0S1_max=1, Monotonicity="General",
##D Type="All.Densities", MainPlot=" ", Cex.Legend=1, 
##D Cex.Position="topright", ylim=c(0, 20)) 
## End(Not run)


