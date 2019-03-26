library(meaRtools)


### Name: si_find_bursts
### Title: Find bursts
### Aliases: si_find_bursts
### Keywords: poisson surprise burst

### ** Examples

data("S")  
allb <- lapply(S$spikes, si_find_bursts, S$parameters$s_min )



