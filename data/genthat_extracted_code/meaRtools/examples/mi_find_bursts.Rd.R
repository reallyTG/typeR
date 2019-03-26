library(meaRtools)


### Name: mi_find_bursts
### Title: Find bursts
### Aliases: mi_find_bursts
### Keywords: maximum interval burst IBI allb

### ** Examples

data("S")  
allb <- lapply(S$spikes, mi_find_bursts, S$parameters$mi_par )



