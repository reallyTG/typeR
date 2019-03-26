library(braidrm)


### Name: evalBRAIDrsm
### Title: Calculate BRAID Surface Values
### Aliases: evalBRAIDrsm
### Keywords: regression

### ** Examples

conc1 <- rep(seq(0,3*10^-6,length=50),each=50)
conc2 <- rep(seq(0,3*10^-6,length=50),times=50)

# Additive surface
act <- evalBRAIDrsm(conc1,conc2,parv=c(10^-6,10^-6,1.5,1.5,1,0,0,100,100,100))
# A BRAID additive surface is not a Loewe additive surface
act <- evalBRAIDrsm(conc1,conc2,parv=c(10^-6,10^-6,1,3,1,0,0,100,100,100))
# BRAID antagonism
act <- evalBRAIDrsm(conc1,conc2,parv=c(10^-6,10^-6,1.5,1.5,1,-1,0,100,100,100))
# delta-BRAID synergy
act <- evalBRAIDrsm(conc1,conc2,parv=c(10^-6,10^-6,1.5,1.5,1.75,0,0,100,100,100))
# Differing final effects
act <- evalBRAIDrsm(conc1,conc2,parv=c(10^-6,10^-6,1.5,1.5,1,0,0,75,100,100))



