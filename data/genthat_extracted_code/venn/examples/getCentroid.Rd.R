library(venn)


### Name: getCentroid
### Title: Calculate the centroid of a polygon.
### Aliases: getCentroid
### Keywords: functions

### ** Examples


venn("0110")

# centroid for the intersection "0110" in a 4 set diagram
centroid <- getCentroid(getZones("0110"))[[1]]

text(centroid[1], centroid[2], labels = "0110", cex = 0.85)


# centroids for the two zones in the "E not A" zones
venn(5)
area <- getZones("0---1") # list of length 2

polygon(area[[1]], col="lightblue")

polygon(area[[2]], col="lightblue")

text(do.call("rbind", getCentroid(area)),
     labels = c("zone 1", "zone 2"), cex = 0.85)




