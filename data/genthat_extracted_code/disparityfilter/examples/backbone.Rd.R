library(disparityfilter)


### Name: backbone
### Title: Extract the backbone of a weighted network using the disparity
###   filter
### Aliases: backbone get.backbone

### ** Examples

if (require(igraph)) {

  # undirected network
  g <- sample_pa(n = 250, m = 5, directed = FALSE)
  E(g)$weight <- sample(1:25, ecount(g), replace = TRUE)
  backbone(g)
  
  # directed network
  g <- sample_pa(n = 250, m = 5, directed = TRUE)
  E(g)$weight <- sample(1:25, ecount(g), replace = TRUE)
  backbone(g)

}



