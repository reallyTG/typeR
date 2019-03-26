library(designGLMM)


### Name: objfnD_CRD
### Title: Calculate D-optimality criterion for Completely Randomised
###   Design with Poisson response
### Aliases: objfnD_CRD

### ** Examples

# Finding the D-optimality objective value for the design (1,1,1,1,2,2,2,3,3,3)
# where there are three treatments, the treatment means are 1, 2, and 4, and
# there is no overdispersion (sige=0)

objfnD_CRD(c(1,1,1,1,2,2,2,3,3,3),ntmt=3,sige=0,means=c(1,2,4))



