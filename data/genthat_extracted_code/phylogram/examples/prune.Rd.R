library(phylogram)


### Name: prune
### Title: Remove tree nodes by regular expression pattern matching.
### Aliases: prune

### ** Examples

  x <- read.dendrogram(text = "(A:0.1,B:0.2,(C:0.3,D:0.4):0.5);")
  plot(x, horiz = TRUE)
  x <- prune(x, pattern = "^A$")
  plot(x, horiz = TRUE)



