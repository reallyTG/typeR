library(nlirms)


### Name: nlirms-package
### Title: Non-Life Insurance Rate-Making System
### Aliases: nlirms-package nlirms

### ** Examples

# rate-Making system based on the posteriori freqquency component
rmspfc(time = 5, claim = 5, fmu = .2, fsigma = 2, family = "PGA")

# rate-Making system based on the posteriori severity component
rmspsc(time=5, claim=5, sumsev=100, smu = 50, ssigma = 2, family ="EGA")

# rate-Making system based on the posteriori frequency and severity component
rmspfsc(time=5 ,claim=5, fmu = .1, fsigma = 2, sumsev=100, smu = 50, ssigma
  = 3,family = list("PGA","EGA"))



