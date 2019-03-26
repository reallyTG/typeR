library(wordspace)


### Name: nearest.neighbours
### Title: Find Nearest Neighbours in DSM Space (wordspace)
### Aliases: nearest.neighbours nearest.neighbors

### ** Examples


nearest.neighbours(DSM_Vectors, c("apple_N", "walk_V"), n=10)

nearest.neighbours(DSM_Vectors, "apple_N", n=10, method="maximum")

as.dist(nearest.neighbours(DSM_Vectors, "apple_N", n=10, dist.matrix=TRUE))




