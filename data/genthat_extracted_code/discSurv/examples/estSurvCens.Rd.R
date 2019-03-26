library(discSurv)


### Name: estSurvCens
### Title: Estimated Survival Function
### Aliases: estSurvCens
### Keywords: survival

### ** Examples


# Load unemployment data
library(Ecdat)
data(UnempDur)

# Select subsample
subUnempDur <- UnempDur [1:100, ]

######################
# Single event example

# Estimate censoring survival function G(t)
estG <- estSurvCens(dataSet=subUnempDur, timeColumn="spell", 
eventColumns="censor1")
estG

#########################
# Competing risks example

# Estimate censoring survival function G(t)
estG <- estSurvCens(dataSet=subUnempDur, timeColumn="spell", 
eventColumns=c("censor1", "censor2", "censor3", "censor4"))
estG




