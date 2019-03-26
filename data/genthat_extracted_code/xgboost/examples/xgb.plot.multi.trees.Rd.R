library(xgboost)


### Name: xgb.plot.multi.trees
### Title: Project all trees on one tree and plot it
### Aliases: xgb.plot.multi.trees

### ** Examples


data(agaricus.train, package='xgboost')

bst <- xgboost(data = agaricus.train$data, label = agaricus.train$label, max_depth = 15,
               eta = 1, nthread = 2, nrounds = 30, objective = "binary:logistic",
               min_child_weight = 50, verbose = 0)

p <- xgb.plot.multi.trees(model = bst, features_keep = 3)
print(p)

## Not run: 
##D # Below is an example of how to save this plot to a file.
##D # Note that for `export_graph` to work, the DiagrammeRsvg and rsvg packages must also be installed.
##D library(DiagrammeR)
##D gr <- xgb.plot.multi.trees(model=bst, features_keep = 3, render=FALSE)
##D export_graph(gr, 'tree.pdf', width=1500, height=600)
## End(Not run)




