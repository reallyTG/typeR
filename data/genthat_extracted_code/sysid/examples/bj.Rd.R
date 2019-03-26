library(sysid)


### Name: bj
### Title: Estimate Box-Jenkins Models
### Aliases: bj

### ** Examples

data(bjsim)
z <- dataSlice(bjsim,end=1500) # training set
mod_bj <- bj(z,c(2,1,1,1,2))
mod_bj 
residplot(mod_bj) # residual plots




