library(velociraptr)


### Name: uniformExtinction
### Title: Uniform Confidence Intervals
### Aliases: uniformExtinction uniformExtinction,uniformOrigination
###   uniformOrigination

### ** Examples

# Generate an exmaple dataset of fossil ages
FakeAges<-runif(50,50,100)

# Calculate the inferred age of extinction with 95% confidence.
uniformExtinction(FakeAges,Confidence=0.95)

# Calculate the inferred age of origination with 50% confidence.
uniformOrigination(FakeAges,Confidence=0.5)




