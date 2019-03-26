library(PowerTOST)


### Name: power.scABEL
### Title: (Empirical) Power of BE decision via scaled (widened) BE
###   acceptance limits
### Aliases: power.scABEL

### ** Examples

# using all the defaults:
# design="2x3x3", EMA regulatory settings
# PE constraint 0.8-1.25, cap on widening if CV>0.5
# true ratio =0.90, 1E+6 simulations
power.scABEL(CV=0.4, n=29)
# should give:
# Unbalanced design. n(i)=10/10/9 assumed.
# [1] 0.66113
#
# with details=TRUE to view the computational time and components
power.scABEL(CV=0.5, n=54, theta0=1.15, details=TRUE)
# should give (times may differ depending on your machine):
# 1e+05sims. Time elapsed (sec): 0.07
# 
#      p(BE) p(BE-wABEL)    p(BE-pe)   p(BE-ABE) 
#    0.81727     0.82078     0.85385     0.27542
#
# exploring pure ABEL with the EMA regulatory constant
# (without mixed method, without capping, without pe constraint)
rs <- reg_const("EMA")
rs$CVswitch  <- 0
rs$CVcap     <- Inf
rs$pe_constr <- FALSE
power.scABEL(CV=0.5, n=54, theta0=1.15, regulator=rs)
# should give
# [1] 0.8519



