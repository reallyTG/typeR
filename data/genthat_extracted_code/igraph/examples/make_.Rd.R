library(igraph)


### Name: make_
### Title: Make a new graph
### Aliases: make_

### ** Examples

r <- make_(ring(10))
l <- make_(lattice(c(3, 3, 3)))

r2 <- make_(ring(10), with_vertex_(color = "red", name = LETTERS[1:10]))
l2 <- make_(lattice(c(3, 3, 3)), with_edge_(weight = 2))

ran <- sample_(degseq(c(3,3,3,3,3,3), method = "simple"), simplified())
degree(ran)
is_simple(ran)



