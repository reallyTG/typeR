library(HyperbolicDist)


### Name: gigCheckPars
### Title: Check Parameters of the Generalized Inverse Gaussian
###   Distribution
### Aliases: gigCheckPars
### Keywords: distribution

### ** Examples

gigCheckPars(c(-0.5,5,2.5))      # normal
gigCheckPars(c(0.5,-5,2.5))      # error
gigCheckPars(c(0.5,5,-2.5))      # error
gigCheckPars(c(0.5,-5,-2.5))     # error
gigCheckPars(c(0.5,0,2.5))       # gamma
gigCheckPars(c(-0.5,0,2.5))      # error
gigCheckPars(c(0.5,0,0))         # error
gigCheckPars(c(-0.5,0,0))        # error
gigCheckPars(c(0.5,5,0))         # error
gigCheckPars(c(-0.5,5,0))        # invgamma



