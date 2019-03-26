library(onemap)


### Name: rf_graph_table
### Title: Plots pairwise recombination fractions and LOD Scores in a
###   heatmap
### Aliases: rf_graph_table
### Keywords: utilities

### ** Examples


## Not run: 
##D ##outcross example
##D   data(example_out)
##D   twopt <- rf_2pts(example_out)
##D   all_mark <- make_seq(twopt,"all")
##D   groups <- group(all_mark)
##D   LG1 <- make_seq(groups,1)
##D   LG1.rcd <- rcd(LG1)
##D   rf_graph_table(LG1.rcd, inter=FALSE)
##D 
##D 
##D   ##Now, using interactive Tcl-Tk
##D   rf_graph_table(LG1.rcd, scale=2, inter=TRUE)
##D 
##D   ##F2 example
##D   data(onemap_example_f2)
##D   twopt <- rf_2pts(onemap_example_f2)
##D   all_mark <- make_seq(twopt,"all")
##D   groups <- group(all_mark)
##D 
##D   ##"pre-allocate" an empty list of length groups$n.groups (3, in this case)
##D   maps.list<-vector("list", groups$n.groups)
##D 
##D   for(i in 1:groups$n.groups){
##D     ##create linkage group i
##D     LG.cur <- make_seq(groups,i)
##D     ##ordering
##D     map.cur<-order_seq(LG.cur, subset.search = "sample")
##D     ##assign the map of the i-th group to the maps.list
##D     maps.list[[i]]<-make_seq(map.cur, "force")
##D   }
##D   ##Plot LOD/recombination fraction matrices for each group
##D   op <- par(mfrow = c(1, 3))
##D   for(i in 1:groups$n.groups)
##D     rf_graph_table(maps.list[[i]], axis.cex=.7, main=paste("Group", i),inter=FALSE)
##D   par(op)
## End(Not run)




