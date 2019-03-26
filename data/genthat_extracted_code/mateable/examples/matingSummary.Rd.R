library(mateable)


### Name: matingSummary
### Title: Summarize a Mating Scene
### Aliases: matingSummary

### ** Examples

eelr <- makeScene(eelr2012, startCol = "firstDay", endCol = "lastDay",
  xCol = "Ecoord", yCol = "Ncoord", idCol = "tagNo")
eelrSum <- matingSummary(eelr)
eelrSum[c("minX", "minY", "maxX", "maxY")]



