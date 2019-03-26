library(admixturegraph)


### Name: four_leaves_graphs
### Title: Four leaves graphs.
### Aliases: four_leaves_graphs
### Keywords: datasets

### ** Examples

## No test: 
# While the usage of this function is pretty self-explanatory, let's plot all the graphs
# just for browsing.
for (i in seq(1, length(four_leaves_graphs))) {
  graph <- four_leaves_graphs[[i]](c("A", "B", "C", "D"))
  # This is how you include quotation marks in strings by the way:
  title <- paste("four_leaves_graphs[[", i, "]](c(\"A\", \"B\", \"C\", \"D\"))", sep = "")
  plot(graph, color = "tomato3", title = title)
}
## End(No test)




