library(designGLMM)


### Name: objfnD_BD
### Title: Calculate D-optimality criterion value for a Block Design
### Aliases: objfnD_BD

### ** Examples

# Finding the D-optimality objective value for the design ((1,1,2,2),(1,1,2,3),(1,2,2,3))
# where there are three treatments in three blocks of size four when the treatment means
# are 1, 2, and 4, the between block standard deviation is 0.2 (sigb=0.2) and there is
# no overdispersion (sige=0)

objfnD_BD(c(1,1,2,2,1,1,2,3,1,2,2,3), ntmt=3, blksz=4, sigb=0.2, sige=0, means=c(1,2,4))



