library(igraph)


### Name: as_long_data_frame
### Title: Convert a graph to a long data frame
### Aliases: as_long_data_frame

### ** Examples

g <- make_(ring(10),
        with_vertex_(name = letters[1:10], color = "red"),
        with_edge_(weight = 1:10, color = "green")
      )
as_long_data_frame(g)



