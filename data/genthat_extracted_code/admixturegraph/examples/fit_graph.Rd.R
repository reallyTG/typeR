library(admixturegraph)


### Name: fit_graph
### Title: Fit the graph parameters to a data set.
### Aliases: fit_graph

### ** Examples

## No test: 
# For example, let's fit the following two admixture graph to an example data on bears:

data(bears)
print(bears)

leaves <- c("BLK", "PB", "Bar", "Chi1", "Chi2", "Adm1", "Adm2", "Denali", "Kenai", "Sweden") 
inner_nodes <- c("R", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "M", "N")
edges <- parent_edges(c(edge("BLK", "R"),
                        edge("PB", "v"),
                        edge("Bar", "x"),
                        edge("Chi1", "y"),
                        edge("Chi2", "y"),
                        edge("Adm1", "z"),
                        edge("Adm2", "z"),
                        edge("Denali", "t"),
                        edge("Kenai", "s"),
                        edge("Sweden", "r"),
                        edge("q", "R"),
                        edge("r", "q"),
                        edge("s", "r"),
                        edge("t", "s"),
                        edge("u", "q"),
                        edge("v", "u"),
                        edge("w", "M"),
                        edge("x", "N"),
                        edge("y", "x"),
                        edge("z", "w"),
                        admixture_edge("M", "u", "t"),
                        admixture_edge("N", "v", "w")))
admixtures <- admixture_proportions(c(admix_props("M", "u", "t", "a"),
                                      admix_props("N", "v", "w", "b")))
bears_graph <- agraph(leaves, inner_nodes, edges, admixtures)
plot(bears_graph, show_admixture_labels = TRUE)

fit <- fit_graph(bears, bears_graph)
summary(fit)

# It turned out the values of admixture proportions had no effect on the cost function. This is not
# too surprising because the huge graph contains a lot of edge variables compared to the tiny 
# amount of data we used! Note however that the mere existence of the admixture event with non- 
# trivial (not zero or one) admixture proportion might still decrease the cost function.
## End(No test)




