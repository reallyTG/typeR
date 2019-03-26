library(DClusterm)


### Name: get.stclusters
### Title: Gets areas in a spatio-temporal cluster
### Aliases: get.stclusters

### ** Examples

library("DClusterm")
library("RColorBrewer")

data("brainNM")
data("brainNM_clusters")

stcl <- get.stclusters(brainst, nm.cl0)
#Get first cluster
brainst$CLUSTER <- ""
brainst$CLUSTER[ stcl[[1]] ] <- "CLUSTER"

#Plot cluster
stplot(brainst[, , "CLUSTER"], at = c(0, 0.5, 1.5), col = "#4D4D4D",
  col.regions = c("white", "gray"))




