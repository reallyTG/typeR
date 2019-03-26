library(phylogram)


### Name: as.cladogram
### Title: Apply unweighted branch lengths.
### Aliases: as.cladogram

### ** Examples

  x <- read.dendrogram(text = "(A:0.1,B:0.2,(C:0.3,D:0.4):0.5);")
  plot(x, horiz = TRUE)
  x <- as.cladogram(x)
  plot(x, horiz = TRUE)



