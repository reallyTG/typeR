library(PowerTOST)


### Name: sampleN.NTIDFDA
### Title: Sample size estimation for BE decision via FDA method for narrow
###   therapeutic index drugs (NTIDs)
### Aliases: sampleN.NTIDFDA

### ** Examples

sampleN.NTIDFDA(CV=0.04,theta0=0.975)
# should give
# n=54 with an (empirical) power of 0.809590
#
# Test formulation with lower variability
sampleN.NTIDFDA(CV=c(0.04,0.06),theta0=0.975)
# should give
# n=20 with an (empirical) power of 0.0.814610
#
# alternative 3-period design
sampleN.NTIDFDA(CV=0.04,theta0=0.975, design="2x2x3")
# should give
# n=86 with power = 0.80364



