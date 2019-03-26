library(netjack)


### Name: network_statistics
### Title: Network Statistic Functions
### Aliases: network_statistics global_efficiency modularity

### ** Examples

data(GroupA)
GroupA1_Net = as_Net(GroupA[[1]], "1", list(community = c(rep(1, 10), rep(2,10))))
global_efficiency(GroupA1_Net)
modularity(GroupA1_Net, "community")



