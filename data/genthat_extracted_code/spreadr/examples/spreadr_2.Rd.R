library(spreadr)


### Name: spreadr_2
### Title: Spread of activation process to determine activation of network
###   nodes.
### Aliases: spreadr_2

### ** Examples

g_d_mat <- matrix(sample(c(0,1), 100, replace = TRUE), 10, 10) 
# make an adjacency matrix and randomly fill some cells with 1s 
diag(g_d_mat) <- 0 # remove self-loops 
library(spreadr)
initial_df <- data.frame(node = 1, activation = 20, stringsAsFactors = FALSE)
result_d <- spreadr_2(start_run = initial_df, decay = 0, retention = 0.5, 
suppress = 0, network = g_d_mat, ignore_time = TRUE, threshold_to_stop = 0.01) 
head(result_d, 10)
tail(result_d, 10)



