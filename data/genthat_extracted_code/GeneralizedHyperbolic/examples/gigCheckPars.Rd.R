library(GeneralizedHyperbolic)


### Name: gigCheckPars
### Title: Check Parameters of the Generalized Inverse Gaussian
###   Distribution
### Aliases: gigCheckPars
### Keywords: distribution

### ** Examples

gigCheckPars(c(5, 2.5, -0.5))      # normal
gigCheckPars(c(-5, 2.5, 0.5))      # error
gigCheckPars(c(5, -2.5, 0.5))      # error
gigCheckPars(c(-5, -2.5, 0.5))     # error
gigCheckPars(c(0, 2.5, 0.5))       # gamma
gigCheckPars(c(0, 2.5, -0.5))      # error
gigCheckPars(c(0, 0, 0.5))         # error
gigCheckPars(c(0, 0, -0.5))        # error
gigCheckPars(c(5, 0, 0.5))         # error
gigCheckPars(c(5, 0, -0.5))        # invgamma



