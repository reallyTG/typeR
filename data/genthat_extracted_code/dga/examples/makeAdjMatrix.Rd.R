library(dga)


### Name: makeAdjMatrix
### Title: Adjacency Matrix Converter
### Aliases: makeAdjMatrix
### Keywords: adjacency matrix graph

### ** Examples



## The function is currently defined as
function (graph, p) 
{
    Adj <- matrix(0, nrow = p, ncol = p)
    diag(Adj) <- 1
    for (i in 1:length(graph$C)) {
        if (length(graph$C[[i]]) > 1) {
            combns <- combn(graph$C[[i]], 2)
            Adj[combns[1], combns[2]] <- 1
        }
    }
    for (i in 1:length(graph$S)) {
        if (length(graph$S[[i]]) > 1) {
            combns <- combn(graph$S[[i]], 2)
            Adj[combns[1], combns[2]] <- 1
        }
    }
    Adj <- Adj + t(Adj)
    Adj[Adj > 1] <- 1
    return(Adj)
  }



