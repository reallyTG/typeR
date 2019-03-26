library(GPoM)


### Name: findAllSets
### Title: Find all possible sets of equation combinations considering an
###   ensemble of possible equation.
### Aliases: findAllSets

### ** Examples

#############
# Example 1 #
#############
# We build an example
allFilt <- list()
# For equation 1 (variable X1)
allFilt$Np1 <- 1         # only one formulation with one single parameter
# For equation 2 (variable X2)
allFilt$Np2 <- c(3, 4)   # two potential formulations, with respectively three and four parameters
# For equation 3 (variable X3)
allFilt$Np3 <- c(2, 4)   # two potential formulations, with respectively two and four parameters
# Formulations for variables Xi:
# For X1:
allFilt$X1 <- t(as.matrix(c(0,0,0,1,0,0,0,0,0,0)))
# For X2:
allFilt$X2 <- t(matrix(c(0,-0.85,0,-0.27,0,0,0,0.46,0,0,
                         0,-0.64,0,0,0,0,0,0.43,0,0),
                       ncol=2, nrow=10))
# For X3:
allFilt$X3 <- t(matrix(c(0, 0.52,  0, -1.22e-05,  0, 0, 0.99, 5.38e-05, 0, 0,
                         0, 0.52, 0, 0, 0, 0, 0.99, 0, 0, 0),
                       ncol=2, nrow=10))
# From these individual we can retrieve all possible formulations
findAllSets(allFilt, nS=c(3), nPmin=1, nPmax=14)
# if only formulations with seven maximum number of terms are expected:
findAllSets(allFilt, nS=c(3), nPmin=1, nPmax=7)




