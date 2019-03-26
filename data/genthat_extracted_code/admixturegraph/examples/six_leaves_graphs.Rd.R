library(admixturegraph)


### Name: six_leaves_graphs
### Title: Six leaves graphs.
### Aliases: six_leaves_graphs
### Keywords: datasets

### ** Examples

## No test: 
# While the usage of this function is pretty self-explanatory, let's plot all the graphs
# just for browsing.
for (i in seq(1, length(six_leaves_graphs))) {
  graph <- six_leaves_graphs[[i]](c("A", "B", "C", "D", "E", "F"))
  # This is how you include quotation marks in strings by the way:
  title <- paste("six_leaves_graphs[[", i,
                 "]](c(\"A\", \"B\", \"C\", \"D\", \"E\", \"F\"))", sep = "")
  plot(graph, color = "yellow4", title = title)
}
## End(No test)




