library(meaRtools)


### Name: remove_spikes
### Title: remove_spikes
### Aliases: remove_spikes
### Keywords: spikes

### ** Examples

data("S") # load data
r<-remove_spikes(S, c(-1, -2))

S$channels[1:2] # original 's' object first 2 channels
r$channels[1:2] # first 2 channels have been removed

S$NCells # original count of channels
r$NCells # count of channels after 2 channels removed

S$nspikes # original spike count of first 2 channels
r$nspikes # spike count of first 2 channels after 2 channels removed

# OR keep only first 2 channels
t<-remove_spikes(S, c(1, 2))
t$channels



