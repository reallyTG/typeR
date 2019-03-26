library(phylobase)


### Name: hasEdgeLength
### Title: edgeLength methods
### Aliases: hasEdgeLength hasEdgeLength,phylo4-method edgeLength
###   edgeLength,phylo4-method edgeLength<- edgeLength<-
###   edgeLength<-,phylo4-method edgeLength<-,phylo4,ANY-method depthTips
###   depthTips,phylo4-method depthTips,phylo4-methods nodeDepth
###   nodeDepth,phylo4-method nodeHeight nodeHeight,phylo4-method
###   sumEdgeLength sumEdgeLength,phylo4-method isUltrametric
###   isUltrametric,phylo4-method

### ** Examples

  data(geospiza)
  hasEdgeLength(geospiza) # TRUE
  topoGeo <- geospiza
  edgeLength(topoGeo) <- NULL
  hasEdgeLength(topoGeo)  # FALSE

  edgeLength(geospiza)[2]       # use the position in vector
  edgeLength(geospiza)["16-17"] # or the name of the edge
  edgeLength(geospiza, 17)      # or the descendant node of the edge

  ## The same methods can be used to update an edge length
  edgeLength(geospiza)[2] <- 0.33
  edgeLength(geospiza)["16-17"] <- 0.34
  edgeLength(geospiza, 17) <- 0.35

  ## Test if tree is ultrametric
  isUltrametric(geospiza)   # TRUE
  ## indeed all tips are at the same distance from the root
  nodeHeight(geospiza, nodeId(geospiza, "tip"), from="root")
  ## compare distances from tips of two MRCA
  nodeHeight(geospiza, MRCA(geospiza, c("pallida", "psittacula")), from="min_tip")
  nodeHeight(geospiza, MRCA(geospiza, c("fortis", "difficilis")), from="min_tip")
  ## or the same but from the root
  nodeHeight(geospiza, MRCA(geospiza, c("pallida", "psittacula")), from="root")
  nodeHeight(geospiza, MRCA(geospiza, c("fortis", "difficilis")), from="root")



