library(ExPanDaR)


### Name: prepare_by_group_bar_graph
### Title: Prepares a by Group Bar Graph
### Aliases: prepare_by_group_bar_graph

### ** Examples

data(russell_3000)
graph <- prepare_by_group_bar_graph(russell_3000, "sector", "ni_sales", median)
graph$plot



