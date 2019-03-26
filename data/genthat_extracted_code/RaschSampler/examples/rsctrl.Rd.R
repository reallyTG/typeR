library(RaschSampler)


### Name: rsctrl
### Title: Controls for the Sampling Function
### Aliases: rsctrl
### Keywords: misc

### ** Examples

ctr <- rsctrl(n_eff = 1, seed = 987654321)  # specify new controls
summary(ctr)

## Not run: 
##D ctr2 <- rsctrl(step = -3, n_eff = 10000) # incorrect specifications
## End(Not run)



