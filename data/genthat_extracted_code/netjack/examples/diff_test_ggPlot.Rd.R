library(netjack)


### Name: diff_test_ggPlot
### Title: Difference Test Plots
### Aliases: diff_test_ggPlot

### ** Examples

data(GroupA)
GroupA_Net = as_NetSample(GroupA, 1:20, node.variables = list(community = c(rep(1, 10), rep(2,10))),
  sample.variables = list(group = c(rep(1, 10), rep(2,10))))
Jackknife_GroupA_Net = net_apply(GroupA_Net, node_jackknife)
GlobEff_GroupA_Net = net_stat_apply(Jackknife_GroupA_Net, global_efficiency)
diff_test_ggPlot(GlobEff_GroupA_Net)



