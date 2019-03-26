library(TP.idm)


### Name: TP.idm-package
### Title: Estimation of Transition Probabilities for the Illness-Death
###   Model
### Aliases: TP.idm-package TP.idm
### Keywords: package

### ** Examples

data(colonTP)

# create a TPidm object with s = 0, t = "last" (default),
# CI = TRUE (default) and method = "AJ":
aj0ci <- TPidm(colonTP, s = 0, method = "AJ")
summary(aj0ci) # summarizing the results
plot(aj0ci) # plotting all occupation probabilities



