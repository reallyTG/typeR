library(PairedData)


### Name: SkiExperts
### Title: Actual and imaginary performances in ski
### Aliases: SkiExperts
### Keywords: datasets

### ** Examples

data(SkiExperts)

# Visualising
with(SkiExperts,plot(paired(Actual,Imaginary),type="profile"))

# No underestimation of imaginary time for experts
with(SkiExperts,t.test(paired(Actual,Imaginary)))

# But a very interesting increase in dispersion in their
# predicted times
with(SkiExperts,Var.test(paired(Actual,Imaginary)))



