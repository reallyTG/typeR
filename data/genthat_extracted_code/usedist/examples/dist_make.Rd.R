library(usedist)


### Name: dist_make
### Title: Make a distance matrix using a custom distance function
### Aliases: dist_make

### ** Examples

x <- matrix(sin(1:30), nrow=5)
rownames(x) <- LETTERS[1:5]
manhattan_distance <- function (v1, v2) sum(abs(v1 - v2))
dist_make(x, manhattan_distance, "Manhattan (custom)")



