library(Claddis)


### Name: MinSpanTreeEdges
### Title: Get edges of minimum spanning tree
### Aliases: MinSpanTreeEdges

### ** Examples


# Create a simple square matrix of distances:
dist.matrix <- matrix(c(0,1,2,3,1,0,1,2,2,1,0,1,3,2,1,0), nrow = 4,
  dimnames = list(LETTERS[1:4], LETTERS[1:4]))

# Show matrix to confirm that the off diagonal has the shortest
# distances:
dist.matrix

# Use MinSpanTreeEdges to get the edges for the minimum spanning
# tree:
MinSpanTreeEdges(dist.matrix)

# Use sum of MinSpanTreeEdges to get the length of the minimum
# spanning tree:
sum(MinSpanTreeEdges(dist.matrix))




