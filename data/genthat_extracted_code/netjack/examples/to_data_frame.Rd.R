library(netjack)


### Name: to_data_frame
### Title: Network statistics to long format dataframe
### Aliases: to_data_frame to_data_frame,NetStatSet-method
###   to_data_frame,NetSampleStatSet-method

### ** Examples

data(GroupA)
GroupA_Net = as_NetSample(GroupA, 1:20, node.variables = list(community = c(rep(1, 10), rep(2,10))),
  sample.variables = list(group = c(rep(1, 10), rep(2,10))))
Jackknife_GroupA_Net = net_apply(GroupA_Net, node_jackknife)
GlobEff_GroupA_Net = net_stat_apply(Jackknife_GroupA_Net, global_efficiency)
head(to_data_frame(GlobEff_GroupA_Net))



