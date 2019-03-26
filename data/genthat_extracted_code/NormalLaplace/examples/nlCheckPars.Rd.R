library(NormalLaplace)


### Name: nlCheckPars
### Title: Check Parameters of the Normal Laplace Distribution
### Aliases: nlCheckPars
### Keywords: distribution

### ** Examples

## Correct parameters
nlCheckPars(c(0, 1.5, 1, 2))
nlCheckPars(c(3, 1, 1.5, 2))

## Incorrect parameters, each error providing a different error message
nlCheckPars(c(2, -1, 1, 1))          # invalid sigma
nlCheckPars(c(2, 1, -1, 2))          # invalid alpha
nlCheckPars(c(0, 1, 2, -1))          # invalid beta
nlCheckPars(c(0, -0.01, -0.1, 1))    # sigma and alpha incorrect
nlCheckPars(c(2, -0.5, 1, -0.2))     # sigma and beta incorrect
nlCheckPars(c(1, 1, -0.2, -1))       # alpha and beta incorrect
nlCheckPars(c(0, -0.1, -0.2, -0.3))  # all three parameters erroneous
nlCheckPars(c(0.5, NA, 1, 1))        # NA introduced
nlCheckPars(c(-1, 1, 1))             # incorrect number of parameters



