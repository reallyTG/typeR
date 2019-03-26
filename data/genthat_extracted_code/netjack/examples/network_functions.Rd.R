library(netjack)


### Name: network_functions
### Title: Network Manipulation Functions
### Aliases: network_functions node_jackknife network_jackknife
###   absolute_threshold relative_threshold

### ** Examples

data(GroupA)
GroupA1_Net = as_Net(GroupA[[1]], "1", list(community = c(rep(1, 10), rep(2,10))))
node_jackknife(GroupA1_Net)
network_jackknife(GroupA1_Net, "community")



