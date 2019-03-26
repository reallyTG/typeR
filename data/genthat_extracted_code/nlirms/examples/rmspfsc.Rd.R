library(nlirms)


### Name: rmspfsc
### Title: Rate-making system based on the posteriori freuency and severity
###   component
### Aliases: rmspfsc rmspfsc

### ** Examples

# rate-making system based on the PGA model for frequency and EGA model for severity component
rmspfsc(time=5 ,claim=5, fmu = .1, fsigma = 2, fnu = 1, sumsev=100, smu = 50,
ssigma = 3, snu = 2, family = list("PGA","EGA"),round=2 ,size=8, padlength=4,
padwidth=2)



