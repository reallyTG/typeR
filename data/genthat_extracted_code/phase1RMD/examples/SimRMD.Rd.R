library(phase1RMD)


### Name: SimRMD
### Title: Simulate trial characters of the phase I dose-finding design.
### Aliases: SimRMD

### ** Examples

# Setup the prior distributions for the phase I dose-finding model:
control <- list(
 beta.dose = parm("normal", mean = 0, var = 1000),
 beta.other = parm("normal", mean = 0, var = 1000 ),
 gamma = parm("normal", mean = 0, var = 100 ),
 s2.gamma = parm("invgamma", shape = 0.001, scale = 0.001),
 s2.epsilon = parm("invgamma", shape = 0.001, scale = 0.001)
 )


# Generate the toxicity matrix
tox.matrix <- GenToxProb(
    toxtype = c("Renal", "Neuro", "Heme"), 
	intercept.alpha = c(2, 3, 4.2, 5.7), 
	coef.beta = c(-0.2, -0.4, -0.7), 
	cycle.gamma = 0)

# Simulate the dose-recommendation based on the toxicity matrix
simu <- SimRMD(seed=2014, strDose=1, chSize=3, trlSize=12,
    numTrials=1, sdose=1:6, MaxCycle=5, tox.target=0.28,
    control=control, iter=10, burnin=2, thin=1, chains=1,    
    pathout='./', tox.matrix=tox.matrix)
	



