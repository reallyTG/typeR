library(admixturegraph)


### Name: seven_leaves_graphs
### Title: Seven leaves graphs.
### Aliases: seven_leaves_graphs
### Keywords: datasets

### ** Examples

## No test: 
# While the usage of this function is pretty self-explanatory, let's plot all the graphs
# just for browsing.
for (i in seq(1, length(seven_leaves_graphs))) {
  graph <- seven_leaves_graphs[[i]](c("A", "B", "C", "D", "E", "F", "G"))
  # This is how you include quotation marks in strings by the way:
  title <- paste("seven_leaves_graphs[[", i,
                 "]](c(\"A\", \"B\", \"C\", \"D\", \"E\", \"F\", \"G\"))", sep = "")
  plot(graph, color = "seagreen", title = title)
}
## End(No test)




