library(sysid)


### Name: arx
### Title: Estimate ARX Models
### Aliases: arx

### ** Examples

data(arxsim)
mod_arx <- arx(arxsim,c(1,2,2))
mod_arx
plot(mod_arx) # plot the predicted and actual responses




