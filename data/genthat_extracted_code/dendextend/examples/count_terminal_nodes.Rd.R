library(dendextend)


### Name: count_terminal_nodes
### Title: Counts the number of terminal nodes (merging 0 nodes!)
### Aliases: count_terminal_nodes

### ** Examples

# define dendrogram object to play with:
hc <- hclust(dist(USArrests[1:3,]), "ave")
dend <- as.dendrogram(hc)

###
# Trivial case
count_terminal_nodes(dend) # 3 terminal nodes
length(labels(dend)) # 3 - the same number
plot(dend, 
main = "This is considered a tree \n with THREE terminal nodes (leaves)")

###
# NON-Trivial case
str(dend)
attr(dend[[2]], "height") <- 0
count_terminal_nodes(dend) # 2 terminal nodes, why? see this plot:
plot(dend, 
main = "This is considered a tree \n with TWO terminal nodes only")
# while we have 3 leaves, in practice we have only 2 terminal nodes 
# (this is a feature, not a bug.)



