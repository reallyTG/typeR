library(sysid)


### Name: armax
### Title: Estimate ARMAX Models
### Aliases: armax

### ** Examples

data(armaxsim)
z <- dataSlice(armaxsim,end=1533) # training set
mod_armax <- armax(z,c(1,2,1,2))
mod_armax




