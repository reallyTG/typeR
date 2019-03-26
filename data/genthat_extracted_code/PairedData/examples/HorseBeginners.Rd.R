library(PairedData)


### Name: HorseBeginners
### Title: Actual and imaginary performances in equitation
### Aliases: HorseBeginners
### Keywords: datasets

### ** Examples

data(HorseBeginners)

# There is one outlier
with(HorseBeginners,plot(paired(Actual,Imaginary),type="profile"))

# This outlier has a great influence
# on the non robust Pitman-Morgan test of variances
with(HorseBeginners,Var.test(paired(Actual,Imaginary)))
with(HorseBeginners[-1,],Var.test(paired(Actual,Imaginary)))
with(HorseBeginners,grambsch.Var.test(paired(Actual,Imaginary)))
with(HorseBeginners,bonettseier.Var.test(paired(Actual,Imaginary)))



