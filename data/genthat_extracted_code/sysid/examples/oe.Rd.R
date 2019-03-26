library(sysid)


### Name: oe
### Title: Estimate Output-Error Models
### Aliases: oe

### ** Examples

data(oesim)
z <- dataSlice(oesim,end=1533) # training set
mod_oe <- oe(z,c(2,1,2))
mod_oe 
plot(mod_oe) # plot the predicted and actual responses




