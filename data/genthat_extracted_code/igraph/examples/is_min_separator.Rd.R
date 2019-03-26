library(igraph)


### Name: is_min_separator
### Title: Minumal vertex separators
### Aliases: is_min_separator is.minimal.separator

### ** Examples

# The graph from the Moody-White paper
mw <- graph_from_literal(1-2:3:4:5:6, 2-3:4:5:7, 3-4:6:7, 4-5:6:7,
                5-6:7:21, 6-7, 7-8:11:14:19, 8-9:11:14, 9-10,
                10-12:13, 11-12:14, 12-16, 13-16, 14-15, 15-16,
                17-18:19:20, 18-20:21, 19-20:22:23, 20-21,
                21-22:23, 22-23)

# Cohesive subgraphs
mw1 <- induced_subgraph(mw, as.character(c(1:7, 17:23)))
mw2 <- induced_subgraph(mw, as.character(7:16))
mw3 <- induced_subgraph(mw, as.character(17:23))
mw4 <- induced_subgraph(mw, as.character(c(7,8,11,14)))
mw5 <- induced_subgraph(mw, as.character(1:7))

check.sep <- function(G) {
  sep <- min_separators(G)
  sapply(sep, is_min_separator, graph=G)
}

check.sep(mw)
check.sep(mw1)
check.sep(mw2)
check.sep(mw3)
check.sep(mw4)
check.sep(mw5)




