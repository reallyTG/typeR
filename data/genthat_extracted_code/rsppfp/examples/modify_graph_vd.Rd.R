library(rsppfp)


### Name: modify_graph_vd
### Title: Villeneuve and Desaulniers (2005) Algorithm
### Aliases: modify_graph_vd

### ** Examples

# Obtain a graph and its forbidden subpaths
graph <- data.frame(from = c("s", "s", "s", "u", "u", "w", "w", "x", "x", "v", "v",
                             "y", "y"), 
                    to = c("u", "w", "x", "w", "v", "v", "y", "w", "y", "y", "t", "t", "u"), 
                    cost = c(1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L), 
                    stringsAsFactors = FALSE)
                     
fpaths <- data.frame(V1 = c("s", "u"), V2 = c("u", "v"), V3 = c("v", "y"), V4 = c("t", "u"), 
                     stringsAsFactors = FALSE)
                      
# Show the values
graph
fpaths                      

# Call the function and store the result
modify_graph_vd(graph, fpaths)




