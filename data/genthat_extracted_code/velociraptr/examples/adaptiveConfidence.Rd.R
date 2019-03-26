library(velociraptr)


### Name: adaptiveOrigination
### Title: Adaptive Beta Functions
### Aliases: adaptiveExtinction
###   adaptiveExtinction,adaptiveOrigination,thetaNegative,thetaPositive,lambdaNegative,lambdaPositive
###   adaptiveOrigination

### ** Examples

# Generate an exmaple dataset of fossil ages
FakeAges<-runif(50,50,100)

# Calculate the inferred age of extinction with 95% confidence.
adaptiveExtinction(FakeAges,Confidence=0.95)

# Calculate the inferred age of origination with 50% confidence.
adaptiveOrigination(FakeAges,Confidence=0.5)




