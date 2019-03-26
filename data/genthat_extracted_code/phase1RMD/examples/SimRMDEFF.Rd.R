library(phase1RMD)


### Name: SimRMDEFF
### Title: Simulation for an Adaptive, Multi-Stage Phase I Dose-Finding
###   Design
### Aliases: SimRMDEFF

### ** Examples


#######Dose 5 target toxicity dose, flat cycle effect#####################

###############a flat dose-efficacy pattern###############################

# simul <- SimRMDEFF(toxtype = c("H", "L", "M"), 
                   # intercept.alpha = c(1.9, 2.3, 2.6, 3.1), 
                   # coef.beta = c(-0.3, -0.2, -0.25), 
                   # cycle.gamma = 0, tox.target = 0.23, 
                   # thrd1 = 0.23, thrd2 = 0.23,
                   # eff.structure = rep(0.5, 6),
                   # p1 = 0.1, p2 = 0.1, ps1 = 0.1, 
                   # numTrials = 1)





