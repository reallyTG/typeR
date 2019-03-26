library(fakeR)


### Name: simulate_dataset_ts
### Title: Simulate a dataframe of time series data
### Aliases: simulate_dataset_ts
### Keywords: manip datagen

### ** Examples

# An example using the treering dataset from the R datasets package
tree_ring <- data.frame(treering)
tree_ring$year <- c(1: nrow(tree_ring))
sim_tree_ring <- simulate_dataset_ts(tree_ring, 
                                     cluster="treering", 
                                     time.variable="year")
par(mfrow = c(2, 1), mar = c(3, 3, 4, 2), mgp = 0.9 * 2:0)
plot (tree_ring$year, tree_ring$treering, type='l', 
      main=paste("Original","Normalized ring width"),
      ylab="Ring width", xlab="Year index")
plot (tree_ring$year, tree_ring$treering, type='l', 
      main=paste("Simulated","Normalized ring width"),
      ylab="Ring width", xlab="Year index")



