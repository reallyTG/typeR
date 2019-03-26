library(admixturegraph)


### Name: eight_leaves_trees
### Title: Eight leaves trees.
### Aliases: eight_leaves_trees
### Keywords: datasets

### ** Examples

## No test: 
# While the usage of this function is pretty self-explanatory, let's plot all the graphs
# just for browsing.
for (i in seq(1, length(eight_leaves_trees))) {
  graph <- eight_leaves_trees[[i]](c("A", "B", "C", "D", "E", "F", "G", "H"))
  # This is how you include quotation marks in strings by the way:
  title <- paste("eight_leaves_trees[[", i,
                 "]](c(\"A\", \"B\", \"C\", \"D\", \"E\", \"F\", \"G\", \"H\"))", sep = "")
  plot(graph, color = "brown", title = title)
}
## End(No test)




