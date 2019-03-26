library(netjack)


### Name: as_NetSample
### Title: Constructor for a 'NetSample' object
### Aliases: as_NetSample

### ** Examples

data(GroupA)
GroupA_Net = as_NetSample(GroupA, 1:20, node.variables = list(community = c(rep(1, 10), rep(2,10))),
 sample.variables = list(group = c(rep(1, 10), rep(2,10))))



