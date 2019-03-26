library(phase1RMD)


### Name: plot.RunRMDVal
### Title: plot nTTP Toxicity-based in cycle 1 for all doses.
### Aliases: plot.RunRMDVal

### ** Examples

# Setup the prior distributions for the phase I dose-finding model:
control <- list(
 beta.dose = parm("normal", mean = 0, var = 1000),
 beta.other = parm("normal", mean = 0, var = 1000 ),
 gamma = parm("normal", mean = 0, var = 100 ),
 s2.gamma = parm("invgamma", shape = 0.001, scale = 0.001),
 s2.epsilon = parm("invgamma", shape = 0.001, scale = 0.001)
 )
 
# Load the example patient toxicity data:
data(patdata)

# Estimate the dose-recommendation of the next patient cohort based on the toxicity data:
res <- RunRMD(data=patdata, control=control, tox.target=0.28, 
  iter=2000, burnin=500, thin=1, chains=1)

plot(res);




