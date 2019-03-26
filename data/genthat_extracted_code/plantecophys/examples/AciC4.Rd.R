library(plantecophys)


### Name: AciC4
### Title: C4 Photosynthesis
### Aliases: AciC4

### ** Examples

# Simulate a C4 A-Ci curve. 
aci <- AciC4(Ci=seq(5,600, length=101))
with(aci, plot(Ci, ALEAF, type='l', ylim=c(0,max(ALEAF))))



