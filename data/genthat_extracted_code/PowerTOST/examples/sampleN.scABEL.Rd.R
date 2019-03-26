library(PowerTOST)


### Name: sampleN.scABEL
### Title: Sample size estimation for BE decision via scaled (widened) BE
###   acceptance limits
### Aliases: sampleN.scABEL

### ** Examples

# using all the defaults:
# partial replicate design, targetpower=80%,
# true assumed ratio = 0.90, 1E+5 simulated studies
# ABE limits, PE constraint 0.8 - 1.25
# EMA regulatory settings
sampleN.scABEL(CV=0.3)
# should result in a sample size n=54, power=0.8159
#
# now with former (inofficial) ANVISA settings, CVswitch=40%
# (now ANVISA uses the same settings as EMA)
reg <- reg_const("USER", r_const=0.76, CVswitch=0.4, CVcap=0.5)
reg$name <- "Old ANVISA"
sampleN.scABEL(CV=0.3, regulator=reg)
# should result in n=60, power=0.8101

# for the full replicate design, target power = 90%
# true assumed ratio = 0.9, FDA regulatory settings
# sims based on evalaution via ISC
sampleN.scABEL(CV=0.4, targetpower=0.9, theta0=0.9, design="2x2x4", regulator="FDA")
# should result in a sample size n=32, power=0.9125



