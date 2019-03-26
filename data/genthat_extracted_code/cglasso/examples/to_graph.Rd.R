library(cglasso)


### Name: to_graph
### Title: Create Undirected Graphs
### Aliases: to_graph
### Keywords: multivariate graphs

### ** Examples

library("cglasso")
set.seed(123)

#################
# cglasso model #
#################
n <- 100L
p <- 10L
mu <- rep.int(0L, times = p)
X <- rdatacggm(n = n, mu = mu, probr = 0.05)
out <- cglasso(X)
out

# creating the undirected graph associated to the fitted
# model number 3
graph_cglasso <- to_graph(out, nrho = 3L)
graph_cglasso
V(graph_cglasso)
E(graph_cglasso)
plot(graph_cglasso, layout = layout_in_circle(graph_cglasso))

# creating the weighted graph associated to the fitted
# model number 3
graph_cglasso <- to_graph(out, nrho = 3L, weighted = TRUE)
graph_cglasso
E(graph_cglasso)
E(graph_cglasso)$weight
plot(graph_cglasso, layout = layout_in_circle(graph_cglasso))

#################
# mglasso model #
#################
R <- event(X)
X <- as.matrix(X)
X[R == 1L] <- NA
out <- mglasso(X)
out

# creating the undirected graph associated to the fitted
# model number 3
graph_mglasso <- to_graph(out, nrho = 3L)
graph_mglasso
V(graph_mglasso)
E(graph_mglasso)
plot(graph_mglasso, layout = layout_in_circle(graph_mglasso))

# creating the weighted graph associated to the fitted
# model number 3
graph_mglasso <- to_graph(out, nrho = 3L, weighted = TRUE)
graph_mglasso
E(graph_mglasso)
E(graph_mglasso)$weight
plot(graph_mglasso, layout = layout_in_circle(graph_mglasso))

#################
# glasso model #
#################
n <- 100L
p <- 10L
X <- matrix(rnorm(n * p), nrow = n, ncol = p)
out <- glasso(X)
out

# creating the undirected graph associated to the fitted
# model number 3
graph_cglasso <- to_graph(out, nrho = 3L)
graph_cglasso
V(graph_cglasso)
E(graph_cglasso)
plot(graph_cglasso, layout = layout_in_circle(graph_cglasso))

# creating the weighted graph associated to the fitted
# model number 3
graph_cglasso <- to_graph(out, nrho = 3L, weighted = TRUE)
graph_cglasso
E(graph_cglasso)
E(graph_cglasso)$weight
plot(graph_cglasso, layout = layout_in_circle(graph_cglasso))



