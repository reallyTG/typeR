library(DClusterm)


### Name: mergeknclusters
### Title: Merges clusters so that they are identifed as levels of a
###   factor.
### Aliases: mergeknclusters

### ** Examples

library("DClusterm")
library("RColorBrewer")

data("NY8")
data("NY8_clusters")

stcl <- mergeknclusters(NY8, ny.cl1, 1:2)
#Get first cluster
NY8$CLUSTER <- stcl

#Plot cluster
spplot(NY8, "CLUSTER", col.regions = c("white", "lightgray", "gray"))




