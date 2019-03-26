library(DClusterm)


### Name: knbinary
### Title: Constructs data frame with clusters in binary format.
### Aliases: knbinary

### ** Examples

library("DClusterm")
library("RColorBrewer")

data("NY8")
data("NY8_clusters")

stcl <- knbinary(NY8, ny.cl1)
#Get first cluster
NY8$CLUSTER <- stcl[, 1]

#Plot cluster
spplot(NY8, "CLUSTER", at = c(0, 0.5, 1.5), col = "#4D4D4D",
  col.regions = c("white", "gray"))




