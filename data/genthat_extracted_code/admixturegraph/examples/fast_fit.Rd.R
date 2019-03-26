library(admixturegraph)


### Name: fast_fit
### Title: A fast version of graph fitting.
### Aliases: fast_fit

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

fit <- fast_fit(bears, bears_graph)
print(fit$best_error)

# The result is just the minimal value of the cost function and the values of admixture proportions
# where it's obtained, no deeper analysis of the fit.
## End(No test)




