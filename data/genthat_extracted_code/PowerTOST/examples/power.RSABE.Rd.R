library(PowerTOST)


### Name: power.RSABE
### Title: (Empirical) Power for BE decision via linearized scaled ABE
###   criterion
### Aliases: power.RSABE

### ** Examples

# using all the defaults:
# design="2x3x3" -> partial replicate
# ABE limits, PE constraint 0.8-1.25
# true ratio =0.90, 1E+5 simulations
power.RSABE(CV=0.4, n=36)
# should give
# [1] 0.83634
#
# to explore the simulation error due to the state of the
# random number generator
power.RSABE(CV=0.4, n=36, setseed=FALSE)
# will give something like
# [1] 0.83725
#
# explore pure RSABE (without mixed method, without pe constraint)
rs <- reg_const("FDA")
rs$CVswitch <- 0
rs$pe_constr <- FALSE
power.RSABE(CV=0.4, n=36, regulator=rs)
# should give
# [1] 0.84644



