library(PowerTOST)


### Name: sampleN.HVNTID
### Title: Sample size estimation for BE decision via FDA method for highly
###   variable (HV) narrow therapeutic index drugs (NTIDs)
### Aliases: sampleN.HVNTID

### ** Examples

# using all defaults but CV
sampleN.HVNTID(CV=0.3)
# should give
# n=22 with an (empirical) power of 0.829700

# Test formulation with lower variability but same pooled CV
CVs <- CVp2CV(0.3, ratio=0.25)
sampleN.HVNTID(CV=CVs)
# should give (no distinct difference to example above)
# n=22 with an (empirical) power of 0.837520



