library(GeneralizedHyperbolic)


### Name: ghypCheckPars
### Title: Check Parameters of the Generalized Hyperbolic Distribution
### Aliases: ghypCheckPars
### Keywords: distribution

### ** Examples

ghypCheckPars(c(0, 2.5, -0.5, 1, 0))      # error
ghypCheckPars(c(0, 2.5, 0.5, 0, 0))       # normal
ghypCheckPars(c(0, 1, 1, -1, 0))          # error
ghypCheckPars(c(2, 0, 1, 0.5, 0))         # error
ghypCheckPars(c(0, 5, 2, 1.5, 0))         # normal
ghypCheckPars(c(0, -2.5, -0.5, 1, 1))     # error
ghypCheckPars(c(0, -1, 0.5, 1, 1))        # error
ghypCheckPars(c(0, 0, -0.5, -1, 1))       # error
ghypCheckPars(c(2, 0, 0.5, 0, -1))        # error
ghypCheckPars(c(2, 0, 1, 0.5, 1))         # skew laplace
ghypCheckPars(c(0, 1, 1, 1, -1))          # skew hyperbolic



