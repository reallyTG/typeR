## ---- eval=TRUE----------------------------------------------------------
options(stringsAsFactors = FALSE) # to prevent strings from being converted to a factor class
extrafont::loadfonts(quiet=TRUE)

# install.packages('devtools')
# library(devtools)
# install_github('csqsiew/spreadr') # download spreadr from my github page
library(spreadr)

## ---- warning=FALSE------------------------------------------------------
library(igraph)
set.seed(1)

g <- sample_gnp(20, 0.2, directed = F, loops = F) # make a random network
V(g)$name <- paste0('N', as.character(1:gorder(g))) # give some meaningful labels for the 'name' attribute

V(g)$color <- c('blue', rep('white', 19))
l <- layout_with_fr(g) # to save the layout 
plot(g, l = l, vertex.size = 10, vertex.label.dist = 2, vertex.label.cex = 0.8)
# the blue node will be assigned activation at t = 0

## ------------------------------------------------------------------------
initial_df <- data.frame(node = 'N1', activation = 20, stringsAsFactors = F)
initial_df

## ------------------------------------------------------------------------
result <- spreadr::spreadr(start_run = initial_df, decay = 0,
                              retention = 0.5, suppress = 0,
                              network = g, time = 10) 

## ------------------------------------------------------------------------
head(result, 10) # view the results
tail(result, 10)
# write.csv(result, file = 'result.csv') # save the results 

library(ggplot2) 
a1 <- data.frame(node = 'N1', activation = 20, time = 0) # add back initial activation at t = 0
result_t0 <- rbind(result,a1)
ggplot(data = result_t0, aes(x = time, y = activation, color = node, group = node)) +
  geom_point() + geom_line() + ggtitle('unweighted, undirected network') # visualize the results 

## ------------------------------------------------------------------------
# weighted, undirected network example 
g_w <- g
set.seed(2)
E(g_w)$weight <- runif(gsize(g_w)) # make the edges in the network have different weights ranging from 0 to 1 (excluding extreme values)

result_w <- spreadr::spreadr(start_run = initial_df, decay = 0,
                              retention = 0.5, suppress = 0,
                              network = g_w, time = 10) 

result_w_t0 <- rbind(result_w, a1) # add back initial activation at t = 0
ggplot(data = result_w_t0, aes(x = time, y = activation, color = node, group = node)) +
  geom_point() + geom_line() + ggtitle('weighted, undirected network') # visualize the results 

## ------------------------------------------------------------------------
# unweighted, directed network example
set.seed(3)
g_d_mat <- matrix(sample(c(0,1), 100, replace = T), 10, 10) # make a matrix and randomly fill some cells with 1s 
diag(g_d_mat) <- 0 # remove self-loops 
g_d_mat

# spreadr will work on an adjacency matrix too 
result_d <- spreadr::spreadr(start_run = data.frame(node = 1, activation = 20, stringsAsFactors = F), 
                             decay = 0,
                              retention = 0.5, suppress = 0,
                              network = g_d_mat, time = 10) 

result_d_t0 <- rbind(result_d, data.frame(node = 1, activation = 20, time = 0)) # add back initial activation at t = 0
ggplot(data = result_d_t0, aes(x = time, y = activation, color = node, group = node)) +
  geom_point() + geom_line() + ggtitle('unweighted, directed network') 

## ------------------------------------------------------------------------
# first column 
data.frame(node = 1:10, edge = g_d_mat[,1])
# hence activation is going from node 1 to nodes 3,4,10 - as in the plot 

# first row - wrong direction!
data.frame(node = 1:10, edge = g_d_mat[1,])
# activation does NOT go from node 1 to nodes 3,4,5,7,8,10

