library(PCDimension)


### Name: compareAgDimMethods
### Title: Compare Methods to Divide Steps into "Long" and "Short"
### Aliases: compareAgDimMethods
### Keywords: models

### ** Examples

# simulate variances
lambda <- rev(sort(diff(sort(c(0, 1, runif(9))))))
# apply the Auer-Gervini method
ag <- AuerGervini(lambda, dd=c(3,10))
# try different methods
agfuns <- list(twice=agDimTwiceMean,
               km=agDimKmeans,
               cpt=agDimCPT)
compareAgDimMethods(ag, agfuns)



