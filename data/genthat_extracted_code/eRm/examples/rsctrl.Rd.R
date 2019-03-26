library(eRm)


### Name: rsctrl
### Title: Controls for the Sampling Function
### Aliases: rsctrl
### Keywords: misc

### ** Examples

ctr <- rsctrl(n_eff = 1, seed = 987654321)  # specify new controls
summary(ctr)

## Not run: 
##D # incorrect specifications will lead to an error
##D ctr2 <- rsctrl(step = -3, n_eff = 10000)
## End(Not run)



