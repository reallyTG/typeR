library(phylogram)


### Name: reposition
### Title: Reset dendrogram height attributes.
### Aliases: reposition

### ** Examples

  x <- read.dendrogram(text = "(A:0.1,B:0.2,(C:0.3,D:0.4):0.5);")
  plot(x, horiz = TRUE)
  x <- reposition(x)
  plot(x, horiz = TRUE)



