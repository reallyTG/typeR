library(rsppfp)


### Name: modify_graph_hsu
### Title: Hsu et al. (2009) Algorithm
### Aliases: modify_graph_hsu

### ** Examples

# Obtain a graph and its forbidden subpaths
graph <- data.frame(from = c("c", "c", "u", "u", "t", "a", "a", "r", "e", "e", "e", 
                             "p", "i", "i", "n", "o"),
                    to = c("u", "p", "e", "t", "a", "r", "i", "u", "r", "i", "p", 
                           "n", "n", "o", "o", "m"),
                    stringsAsFactors = FALSE)
fpaths <- data.frame(X1 = c("u", "p", "a", "a"), X2 = c("t", "n", "i", "r"), 
                     X3 = c("a", "o", "n", "u"), X4 = c("r", "m", "o", NA),  
                     X5 = c("u", NA, NA, NA), stringsAsFactors = FALSE)

# Show the input
graph
fpaths

# Call the function and store the result
gStar <- modify_graph_hsu(graph, fpaths)
gStar




