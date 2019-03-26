library(designGLMM)


### Name: objfnA_BD
### Title: Calculate A-optimality criterion for Block Design with Poisson
###   response
### Aliases: objfnA_BD

### ** Examples

# Finding the A-optimality objective value for the design ((1,1,2,2),(1,1,2,3),(1,2,2,3))
# where there are three treatments in three blocks of size four when the treatment means
# are 1, 2, and 4, the between block standard deviation is 0.2 (sigb=0.2) and there is
# no overdispersion (sige=0)

objfnA_BD(c(1,1,2,2,1,1,2,3,1,2,2,3), ntmt=3, blksz=4, sigb=0.2, sige=0, means=c(1,2,4))



