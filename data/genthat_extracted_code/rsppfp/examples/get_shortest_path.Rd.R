library(rsppfp)


### Name: get_shortest_path
### Title: igraph Shortest Path
### Aliases: get_shortest_path

### ** Examples

# Given a specific gStar graph:
gStar <- data.frame(from = c("u|v", "s|u|v", "s|u", "s", "s", "u", "w", "w", "x", "x", 
                             "v", "v", "y", "y", "s", "s|u", "u", "u|v"),
                    to = c("t", "u|v|y", "w", "w", "x", "w", "v", "y", "w", "y", "y", "t", 
                            "t", "u", "s|u", "s|u|v", "u|v", "u|v|y"), 
                   weight = c(12L, 3L, 5L, 9L, 7L, 5L, 11L, 10L, 1L, 2L, 3L, 12L, 13L, 0L,
                              8L, 4L, 4L, 3L), 
                   stringsAsFactors = FALSE)
gStar

# Obtain the shortest path
get_shortest_path(gStar, "s", "v", "weight")                                                 





