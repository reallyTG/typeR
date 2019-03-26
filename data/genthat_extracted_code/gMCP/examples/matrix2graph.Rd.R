library(gMCP)


### Name: matrix2graph
### Title: Matrix2Graph and Graph2Matrix
### Aliases: graph2matrix matrix2graph
### Keywords: graphs

### ** Examples



# Bonferroni-Holm:
m <- matrix(rep(1/3, 16), nrow=4)
diag(m) <- c(0, 0, 0, 0)
graph <- matrix2graph(m)
print(graph)
graph2matrix(graph)





