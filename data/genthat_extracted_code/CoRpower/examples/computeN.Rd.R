library(CoRpower)


### Name: computeN
### Title: Estimation of Size and Numbers of Cases and Controls in the
###   Target Population of Active Treatment Recipients At Risk at the
###   Biomarker Sampling Timepoint
### Aliases: computeN

### ** Examples

Nrand = 4100
tau = 3.5
taumax = 24
VEtauToTaumax = 0.75
VE0toTau = 0.75/2
risk0 = 0.034
dropoutRisk = 0.1
propCasesWithS = 1
computeN(Nrand, tau, taumax, VEtauToTaumax, VE0toTau, risk0, dropoutRisk, propCasesWithS)




