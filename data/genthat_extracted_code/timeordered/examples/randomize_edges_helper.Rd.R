library(timeordered)


### Name: randomize_edges_helper
### Title: Does all the work for 'edge_randomization' and
###   'randomized_edges'. An internal function.
### Aliases: randomize_edges_helper
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (edges, randomize_vertices) 
{
    vertex_columns <- c("VertexFrom", "VertexTo")
    unique_edges <- unique(edges[, vertex_columns])
    unique_edge_count <- nrow(unique_edges)
    edge_map <- cbind(unique_edges, unique_edges[sample(unique_edge_count, 
        unique_edge_count), ])
    new_vertex_columns <- c("NewVF", "NewVT")
    colnames(edge_map) <- c(vertex_columns, new_vertex_columns)
    if (randomize_vertices) {
        edge_map[, new_vertex_columns] <- sample(unlist(edge_map[, 
            new_vertex_columns]), unique_edge_count * 2)
        repeat {
            invalid <- (edge_map$NewVF == edge_map$NewVT) | (duplicated(edge_map[, 
                new_vertex_columns]))
            if (sum(invalid) == 0) 
                break
            for (i in which(invalid)) edge_map <- swap(edge_map, 
                i, sample(new_vertex_columns, 1), sample(unique_edge_count, 
                  1), sample(new_vertex_columns, 1))
        }
    }
    original_colnames <- colnames(edges)
    attribute_columns <- original_colnames[!(original_colnames %in% 
        vertex_columns)]
    edges <- merge(edges, edge_map)
    edges <- edges[, c(new_vertex_columns, attribute_columns)]
    colnames(edges)[1:length(new_vertex_columns)] <- vertex_columns
    return(edges)
  }



