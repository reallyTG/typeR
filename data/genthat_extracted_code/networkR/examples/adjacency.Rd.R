library(networkR)


### Name: adjacency
### Title: Create adjacency matrix
### Aliases: adjacency
### Keywords: manip

### ** Examples


from <- c("A", "A", "A", "B", "C")
to <- c("B", "C", "D", "D", "E")
adjacency(from, to)

from <- c("A", "A", "A", "B", "C")
to <- c("B", "C", "D", "D", "E")
weights <- c(1, .5, 1, .7, 1)
adjacency(from, to, weights)




