library(admixturegraph)


### Name: five_leaves_graphs
### Title: Five leaves graphs.
### Aliases: five_leaves_graphs
### Keywords: datasets

### ** Examples

## No test: 
# While the usage of this function is pretty self-explanatory, let's plot all the graphs
# just for browsing.
for (i in seq(1, length(five_leaves_graphs))) {
  graph <- five_leaves_graphs[[i]](c("A", "B", "C", "D", "E"))
  # This is how you include quotation marks in strings by the way:
  title <- paste("five_leaves_graphs[[", i, "]](c(\"A\", \"B\", \"C\", \"D\", \"E\"))",
                 sep = "")
  plot(graph, color = "purple", title = title)
}
## End(No test)




