library(admixturegraph)


### Name: agraph
### Title: Create an admixture graph object.
### Aliases: agraph

### ** Examples

leaves <- c("A", "B", "C", "D")
inner_nodes <- c("ab", "b", "bc", "abc", "abcd")
edges <- parent_edges(c(edge("A", "ab"),
                        edge("B", "b"),
                        edge("C", "bc"),
                        edge("D", "abcd"),
                        edge("ab", "abc"),
                        edge("bc", "abc"),
                        edge("abc", "abcd"),
                        admixture_edge("b", "ab", "bc")))
admixtures <- admixture_proportions(c(admix_props("b", "ab", "bc", "x")))

graph <- agraph(leaves, inner_nodes, edges, admixtures)




