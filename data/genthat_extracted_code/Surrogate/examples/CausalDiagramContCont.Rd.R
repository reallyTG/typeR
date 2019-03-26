library(Surrogate)


### Name: CausalDiagramContCont
### Title: Draws a causal diagram depicting the median correlations between
###   the counterfactuals for a specified range of values of ICA or MICA in
###   the continuous-continuous setting
### Aliases: CausalDiagramContCont
### Keywords: Plot surrogacy Causal-Inference framework Single-trial
###   setting Multiple-trial setting

### ** Examples

## Not run: 
##D  #Time consuming (>5 sec) code parts
##D # Generate the vector of ICA values when rho_T0S0=.91, rho_T1S1=.91, and when the
##D # grid of values {0, .1, ..., 1} is considered for the correlations
##D # between the counterfactuals:
##D SurICA <- ICA.ContCont(T0S0=.95, T1S1=.91, T0T1=seq(0, 1, by=.1), T0S1=seq(0, 1, by=.1), 
##D T1S0=seq(0, 1, by=.1), S0S1=seq(0, 1, by=.1))
##D 
##D #obtain a plot of ICA
##D 
##D # Obtain a causal diagram that provides the medians of the 
##D # correlations between the counterfactuals for the range
##D # of ICA values between .9 and 1 (i.e., which assumed 
##D # correlations between the counterfactuals lead to a 
##D # high ICA?)
##D CausalDiagramContCont(SurICA, Min=.9, Max=1)
##D 
##D # Same, for low values of ICA
##D CausalDiagramContCont(SurICA, Min=0, Max=.5)
## End(Not run)



