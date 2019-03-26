library(netdiffuseR)


### Name: edgelist_to_adjmat
### Title: Conversion between adjacency matrix and edgelist
### Aliases: edgelist_to_adjmat adjmat_to_edgelist
### Keywords: manip

### ** Examples

# Base data
set.seed(123)
n <- 5
edgelist <- rgraph_er(n, as.edgelist=TRUE, p=.2)[,c("ego","alter")]
times <- sample.int(3, nrow(edgelist), replace=TRUE)
w <- abs(rnorm(nrow(edgelist)))

# Simple example
edgelist_to_adjmat(edgelist)
edgelist_to_adjmat(edgelist, undirected = TRUE)

# Using w
edgelist_to_adjmat(edgelist, w)
edgelist_to_adjmat(edgelist, w, undirected = TRUE)

# Using times
edgelist_to_adjmat(edgelist, t0 = times)
edgelist_to_adjmat(edgelist, t0 = times, undirected = TRUE)

# Using times and w
edgelist_to_adjmat(edgelist, t0 = times, w = w)
edgelist_to_adjmat(edgelist, t0 = times, undirected = TRUE, w = w)

# Not recoding ----------------------------------------------------
# Notice that vertices 3, 4 and 5 are not present in this graph.
graph <- matrix(c(
 1,2,6,
 6,6,7
), ncol=2)

# Generates an adjmat of size 4 x 4
edgelist_to_adjmat(graph)

# Generates an adjmat of size 7 x 7
edgelist_to_adjmat(graph, recode.ids=FALSE)

# Dynamic with spells -------------------------------------------------------
edgelist <- rbind(
   c(1,2,NA,1990),
   c(2,3,NA,1991),
   c(3,4,1991,1992),
   c(4,1,1992,1993),
   c(1,2,1993,1993)
)

graph <- edgelist_to_adjmat(edgelist[,1:2], t0=edgelist[,3], t1=edgelist[,4])

# Creating a diffnet object with it so we can apply the plot_diffnet function
diffnet <- as_diffnet(graph, toa=1:4)
plot_diffnet(diffnet, label=rownames(diffnet))

# Missing alter in the edgelist ---------------------------------------------
data(fakeEdgelist)

# Notice that edge 202 is isolated
fakeEdgelist

# The function still includes vertex 202
edgelist_to_adjmat(fakeEdgelist[,1:2])

edgelist




