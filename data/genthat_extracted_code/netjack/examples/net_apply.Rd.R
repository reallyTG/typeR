library(netjack)


### Name: net_apply
### Title: Apply a network manipulation function to a single network, or to
###   a sample of networks
### Aliases: net_apply net_apply,Net,ANY,ANY,ANY-method
###   net_apply,NetSample,ANY,ANY,missing-method

### ** Examples

data(GroupA)
GroupA_Net = as_NetSample(GroupA, 1:20, node.variables = list(community = c(rep(1, 10), rep(2,10))),
 sample.variables = list(group = c(rep(1, 10), rep(2,10))))
Jackknife_GroupA_Net = net_apply(GroupA_Net, node_jackknife)



