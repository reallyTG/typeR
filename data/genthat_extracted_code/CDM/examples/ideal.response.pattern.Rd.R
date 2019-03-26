library(CDM)


### Name: ideal.response.pattern
### Title: Ideal Response Pattern
### Aliases: ideal.response.pattern
### Keywords: Ideal response pattern

### ** Examples

#############################################################################
# EXAMPLE 1: Ideal response pattern sim.qmatrix
#############################################################################

data(sim.qmatrix, package="CDM")

q.matrix <- sim.qmatrix
CDM::ideal.response.pattern( q.matrix )

# compute ideal responses for a reduced skill space
skillspace <- matrix( c( 0,1,0,
                         1,1,0 ), 2,3, byrow=TRUE )
CDM::ideal.response.pattern( q.matrix, skillspace=skillspace)



