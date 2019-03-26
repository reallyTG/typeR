library(phase1RMD)


### Name: RunRMD
### Title: Toxicity-based Dose estimation for the next patient cohort.
### Aliases: RunRMD

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
fit <- RunRMD(data = patdata, control = control, trlSize = 36, tox.target = 0.28, 
  sdose = 1:6, strDose = 1, iter = 2000, burnin = 500, thin = 1, chains = 1)
  



