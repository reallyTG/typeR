library(phylogram)


### Name: ladder
### Title: Reorder tree branches in ladderized pattern.
### Aliases: ladder

### ** Examples

  x <- read.dendrogram(text = "(A:0.1,B:0.2,(C:0.3,D:0.4):0.5);")
  plot(x, horiz = TRUE)
  x <- ladder(x, decreasing = TRUE)
  plot(x, horiz = TRUE)



