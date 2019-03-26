library(phase1RMD)


### Name: parm
### Title: Create prior for the phase 1 dose-finding model
### Aliases: parm

### ** Examples

# Setup the prior distributions for the phase I dose-finding model:
control <- list(
 beta.dose = parm("normal", mean = 0, var = 1000),
 beta.other = parm("normal", mean = 0, var = 1000 ),
 gamma = parm("normal", mean = 0, var = 100 ),
 s2.gamma = parm("invgamma", shape = 0.001, scale = 0.001),
 s2.epsilon = parm("invgamma", shape = 0.001, scale = 0.001)
 )



