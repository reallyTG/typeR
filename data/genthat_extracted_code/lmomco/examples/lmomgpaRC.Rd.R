library(lmomco)


### Name: lmomgpaRC
### Title: B-type L-moments of the Generalized Pareto Distribution with
###   Right-Tail Censoring
### Aliases: lmomgpaRC
### Keywords: L-moment (distribution) Distribution: Generalized Pareto data
###   censoring

### ** Examples

para <- vec2par(c(1500,160,.3),type="gpa") # build a GPA parameter set
lmorph(lmomgpa(para))
lmomgpaRC(para) # zeta = 1 is internally assumed if not available
# The previous two commands should output the same parameter values from
# independent code bases.
# Now assume that we have the sample parameters, but the zeta is nonunity.
para$zeta = .8
lmomgpaRC(para) # The B-type L-moments.



