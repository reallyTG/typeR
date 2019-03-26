library(Surrogate)


### Name: plot MaxEnt ContCont
### Title: Plots the sensitivity-based and maximum entropy based Individual
###   Causal Association when S and T are continuous outcomes in the
###   single-trial setting
### Aliases: 'plot MaxEnt ContCont' plot.MaxEntContCont
### Keywords: Plot surrogacy Causal-Inference framework Single-trial
###   setting Sensitivity ContCont Maximum Entropy

### ** Examples

## Not run: 
##D  #time-consuming code parts
##D # Compute ICA for ARMD dataset, using the grid  
##D # G={-1, -.80, ..., 1} for the undidentifiable correlations
##D 
##D ICA <- ICA.ContCont(T0S0 = 0.769, T1S1 = 0.712, S0S0 = 188.926, 
##D S1S1 = 132.638, T0T0 = 264.797, T1T1 = 231.771, 
##D T0T1 = seq(-1, 1, by = 0.2), T0S1 = seq(-1, 1, by = 0.2), 
##D T1S0 = seq(-1, 1, by = 0.2), S0S1 = seq(-1, 1, by = 0.2))
##D 
##D # Identify the maximum entropy ICA
##D MaxEnt_ARMD <- MaxEntContCont(x = ICA, S0S0 = 188.926, 
##D S1S1 = 132.638, T0T0 = 264.797, T1T1 = 231.771)
##D 
##D   # Explore results using summary() and plot() functions
##D summary(MaxEnt_ARMD)
##D plot(MaxEnt_ARMD)
##D plot(MaxEnt_ARMD, Entropy.By.ICA = TRUE)
## End(Not run)



