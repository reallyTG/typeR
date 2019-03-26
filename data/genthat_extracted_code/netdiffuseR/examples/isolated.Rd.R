library(netdiffuseR)


### Name: isolated
### Title: Find and remove isolated vertices
### Aliases: isolated drop_isolated
### Keywords: manip

### ** Examples

# Generating random graph
set.seed(123)
adjmat <- rgraph_er()

# Making nodes 1 and 4 isolated
adjmat[c(1,4),] <- 0
adjmat[,c(1,4)] <- 0
adjmat

# Finding isolated nodes
iso <- isolated(adjmat)
iso

# Removing isolated nodes
drop_isolated(adjmat)


# Now with a dynamic graph
graph <- rgraph_er(n=10, t=3)

# Making 1 and 5 isolated
graph <- lapply(graph, "[<-", i=c(1,5), j=1:10, value=0)
graph <- lapply(graph, "[<-", i=1:10, j=c(1,5), value=0)
graph

isolated(graph)
drop_isolated(graph)



