library(admixturegraph)


### Name: add_an_admixture
### Title: Adds a new admixture event to a graph.
### Aliases: add_an_admixture

### ** Examples

## No test: 
# To illustrate what the parameter labels_matter does, consider the following graph:

leaves <- c("A", "B", "C")
inner_nodes <- c("R", "x", "y", "M")
edges <- parent_edges(c(edge("x", "R"),
                        edge("y", "R"),
                        edge("A", "x"),
                        edge("B", "M"),
                        edge("C", "y"),
                        admixture_edge("M", "x", "y")))
admixtures <- admixture_proportions(c(admix_props("M", "x", "y", "p")))
graph <- agraph(leaves, inner_nodes, edges, admixtures)
plot(graph, show_admixture_labels = TRUE, title = "graph")

# There are 15 ways this graph can be extended to a graph with two admixture events by
# adding an admixture edge, as can be seeing by having the program explicitly construct
# all the cases:

short_list <- add_an_admixture(graph, "q")
print(length(short_list))

# However, maybe we already have a specific historical event in mind corresponding to the
# original admixture event in graph, or a fixed value for the admixture proportion p.
# Then, for example, it makes a difference to us whether we consider the possibility of
# another admixture event occurring before that event,

leaves <- c("A", "B", "C")
inner_nodes <- c("R", "x", "y", "z", "M", "N")
edges <- parent_edges(c(edge("x", "R"),
                        edge("z", "R"),
                        edge("y", "z"),
                        edge("A", "x"),
                        edge("B", "M"),
                        edge("C", "y"),
                        admixture_edge("N", "x", "z"),
                        admixture_edge("M", "N", "y")))
admixtures <- admixture_proportions(c(admix_props("N", "x", "z", "q"),
                                      admix_props("M", "N", "y", "p")))
example1 <- agraph(leaves, inner_nodes, edges, admixtures)
plot(example1, show_admixture_labels = TRUE, title = "example 1")

# or after that event,

leaves <- c("A", "B", "C")
inner_nodes <- c("R", "x", "y", "z", "M", "N")
edges <- parent_edges(c(edge("x", "R"),
                        edge("y", "R"),
                        edge("z", "y"),
                        edge("A", "x"),
                        edge("B", "N"),
                        edge("C", "z"),
                        admixture_edge("M", "x", "y"),
                        admixture_edge("N", "M", "z")))
admixtures <- admixture_proportions(c(admix_props("M", "x", "y", "p"),
                                      admix_props("N", "M", "z", "q")))
example2 <- agraph(leaves, inner_nodes, edges, admixtures)
plot(example2, show_admixture_labels = TRUE, title = "example 2")

# even though as (acyclic) directed graphs with labeled leaves example 1
# and example 2 are isomorphic.
# Counting cases like that dirrerent, we get 21 possible extensions:

long_list <- add_an_admixture(graph, "q", labels_matter = TRUE)
print(length(long_list))
## End(No test)




