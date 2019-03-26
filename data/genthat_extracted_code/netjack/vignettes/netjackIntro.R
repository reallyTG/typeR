## ------------------------------------------------------------------------
library(netjack)
data("GroupA")

Subject1 <- as_Net(GroupA[[1]], "Subject1")
show(Subject1)


## ------------------------------------------------------------------------
Subject2 <- as_Net(GroupA[[2]], "Subject1", node.variables = list(community = c(rep(1,10), rep(2,10))))

show(Subject2)


## ------------------------------------------------------------------------
GroupASamp = as_NetSample(GroupA, net.names = as.character(1:20) , node.variables = list(community = c(rep(1,10), rep(2,10))), sample.variables = list(group = rep(1, 20)))

show(GroupASamp)



## ------------------------------------------------------------------------
Sub1Jackknifed <- net_apply(network = Subject1, net.function = "node_jackknife")

show(Sub1Jackknifed)

GroupAJackknifed <- net_apply(network = GroupASamp, net.function = "node_jackknife")

show(GroupAJackknifed)

## ------------------------------------------------------------------------

GroupANetJackknifed <- net_apply(GroupASamp, net.function = "network_jackknife", net.function.args = list(network.variable = "community"))

show(GroupANetJackknifed)


## ------------------------------------------------------------------------

Sub1JackknifedGlobEff <- net_stat_apply(Sub1Jackknifed, net.stat.fun = global_efficiency)

show(Sub1JackknifedGlobEff)

GroupAJackknifedGlobEff <- net_stat_apply(GroupAJackknifed, net.stat.fun = global_efficiency)

show(GroupAJackknifedGlobEff)



## ------------------------------------------------------------------------

Sub1Data = to_data_frame(Sub1JackknifedGlobEff)

names(Sub1Data)

GroupAData = to_data_frame(GroupAJackknifedGlobEff)

head(GroupAData)


## ----fig.height=5, fig.width=6, fig.align="center"-----------------------

GroupASamp = as_NetSample(GroupA, net.names = as.character(1:20))
GroupAJackknifed = net_apply(GroupASamp, net.function = "node_jackknife")
GroupAJackknifedGlobEff = net_stat_apply(GroupAJackknifed, net.stat.fun =  "global_efficiency")

diff_test(GroupAJackknifedGlobEff)
diff_test_ggPlot(GroupAJackknifedGlobEff)



## ----fig.height=5, fig.width=6, fig.align="center"-----------------------

fullGroup = c(GroupA, GroupB)

fullSamp = as_NetSample(fullGroup,net.names = as.character(1:40), sample.variables = list(group = c(rep("GroupA", 20), rep("GroupB", 20))))

fullSampJackknifed = net_apply(fullSamp, net.function = "node_jackknife")
fullSampleJackknifedGlobEff = net_stat_apply(fullSampJackknifed, net.stat.fun = "global_efficiency")

group_test(fullSampleJackknifedGlobEff, grouping.variable = "group")

group_test_ggPlot(fullSampleJackknifedGlobEff, grouping.variable="group")


## ----fig.height=5, fig.width=6, fig.align="center"-----------------------
group_diff_test(fullSampleJackknifedGlobEff, grouping.variable = "group")

group_diff_test_ggPlot(fullSampleJackknifedGlobEff, grouping.variable="group")


