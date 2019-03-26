library(designGLMM)


### Name: objfnA_CRD
### Title: Calculate A-optimality criterion for Completely Randomised
###   Design with Poisson response
### Aliases: objfnA_CRD

### ** Examples

# Finding the A-optimality objective value for the design (1,1,1,1,2,2,2,3,3,3)
# where there are three treatments, the treatment means are 1, 2, and 4, and
# there is no overdispersion (sige=0)

objfnA_CRD(c(1,1,1,1,2,2,2,3,3,3),ntmt=3,sige=0,means=c(1,2,4))



