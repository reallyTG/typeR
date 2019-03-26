library(admixturegraph)


### Name: plot.agraph
### Title: Plot an admixture graph.
### Aliases: plot.agraph

### ** Examples

## No test: 
leaves <- c("salmon", "sea horse", "mermaid", "horse", "human", "lobster")
inner_nodes <- c("R", "s", "t", "u", "v", "w", "x", "y", "z")
edges <- parent_edges(c(edge("salmon", "t"),
                        edge("sea horse", "y"),
                        edge("mermaid", "z"),
                        edge("horse", "w"),
                        edge("human", "x"),
                        edge("lobster", "R"),
                        edge("s", "R"),
                        edge("t", "s"),
                        edge("u", "t"),
                        edge("v", "s"),
                        edge("w", "v"),
                        edge("x", "v"),
                        admixture_edge("y", "u", "w"),
                        admixture_edge("z", "u", "x")))
admixtures <- admixture_proportions(c(admix_props("y", "u", "w", "a"),
                                      admix_props("z", "u", "x", "b")))
graph <- agraph(leaves, inner_nodes, edges, admixtures)
plot(graph, show_inner_node_labels = TRUE)

# Suppose now that we prefer to have the outgroup "lobster" on the right side.
# This is achieved by telling the algorithm that the children of "R" should be in
# the order ("s", "lobster"), from left to right:

plot(graph, child_order = list(R = c("s", "lobster")))

# Suppose further that we prefer to have "mermaid" and "human" next to each other,
# as well as "sea horse" and "horse". This is easily achieved by rearranging the leaf
# order proposed by the algorithm. We can also fine-tune by moving "y" a little bit
# to the right, make the admixture platforms a bit shorter, color the nodes, show the
# admixture proportions and give the plot a title:

plot(graph, child_order = list(R = c("s", "lobster")), leaf_order = c(1, 2, 4, 3, 5, 6),
     fix = list(y = c(5, 0)), platform = 0.8, color = "deepskyblue",
     inner_node_color = "skyblue", show_admixture_labels = TRUE,
     title = "Evolution of fish/mammal hybrids")
## End(No test)




