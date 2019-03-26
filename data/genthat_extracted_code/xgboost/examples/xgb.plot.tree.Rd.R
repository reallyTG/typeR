library(xgboost)


### Name: xgb.plot.tree
### Title: Plot a boosted tree model
### Aliases: xgb.plot.tree

### ** Examples

data(agaricus.train, package='xgboost')

bst <- xgboost(data = agaricus.train$data, label = agaricus.train$label, max_depth = 3,
               eta = 1, nthread = 2, nrounds = 2,objective = "binary:logistic")
# plot all the trees
xgb.plot.tree(model = bst)
# plot only the first tree and display the node ID:
xgb.plot.tree(model = bst, trees = 0, show_node_id = TRUE)

## Not run: 
##D # Below is an example of how to save this plot to a file. 
##D # Note that for `export_graph` to work, the DiagrammeRsvg and rsvg packages must also be installed.
##D library(DiagrammeR)
##D gr <- xgb.plot.tree(model=bst, trees=0:1, render=FALSE)
##D export_graph(gr, 'tree.pdf', width=1500, height=1900)
##D export_graph(gr, 'tree.png', width=1500, height=1900)
## End(Not run)




