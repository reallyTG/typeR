library(dodgr)


### Name: dodgr_uncontract_graph
### Title: dodgr_uncontract_graph
### Aliases: dodgr_uncontract_graph

### ** Examples

graph0 <- weight_streetnet (hampi)
nrow (graph0) # 5,729
graph1 <- dodgr_contract_graph (graph0)
nrow (graph1$graph) # 764
graph2 <- dodgr_uncontract_graph (graph1)
nrow (graph2) # 5,729
identical (graph0, graph2) # TRUE

# Insert new data on to the contracted graph and uncontract it:
graph1$graph$new_col <- runif (nrow (graph1$graph))
graph3 <- dodgr_uncontract_graph (graph1)
# graph3 is then the uncontracted graph which includes "new_col" as well



