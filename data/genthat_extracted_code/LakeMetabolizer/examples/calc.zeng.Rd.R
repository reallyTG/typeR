library(LakeMetabolizer)


### Name: calc.zeng
### Title: Estimate sensible and latent heat fluxes
### Aliases: calc.zeng
### Keywords: math methods

### ** Examples

dateTime <- as.POSIXct("2013-12-30 23:00")
Ts <- 22.51
airT <- 20
Uz <- 3  
RH <- 90
atm.press <- 1013
wnd.z <- 2
calc.zeng(dateTime,Ts,airT,Uz,RH,atm.press,wnd.z)



