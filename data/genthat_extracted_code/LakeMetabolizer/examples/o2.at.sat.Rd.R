library(LakeMetabolizer)


### Name: o2.at.sat
### Title: Calculates the equilibrium saturation concentration of oxygen in
###   water at the supplied conditions
### Aliases: o2.at.sat o2.at.sat.base
### Keywords: math, methods

### ** Examples

temp.range = 1:25
sal.range = 1:25

par(mfrow=c(1,2))
plot(temp.range, o2.at.sat.base(temp.range), xlab='Temperature (C)', 
ylab='Oxygen Saturation (mg/L)')
plot(o2.at.sat.base(rep(20,25), salinity=sal.range), xlab='Salinity (PSU)', ylab='')




