library(NlsyLinks)


### Name: CreateSpatialNeighbours
### Title: Distances between related family members, formated for spatial
###   analysis.
### Aliases: CreateSpatialNeighbours
### Keywords: analysis spatial

### ** Examples

dsLinksAll <- Links79Pair
dsLinksGen1Housemates <- dsLinksAll[dsLinksAll$RelationshipPath=="Gen1Housemates", ]
dsLinksGen2Siblings <- dsLinksAll[dsLinksAll$RelationshipPath=="Gen2Siblings", ]

spGen1 <- CreateSpatialNeighbours(dsLinksGen1Housemates)
spGen2 <- CreateSpatialNeighbours(dsLinksGen2Siblings)

head(spGen2)
#Returns: 
#   from  to weight
#3   201 202   0.50
#6   301 302   0.50
#7   301 303   0.50
#9   302 303   0.50
#24  401 403   0.25
#28  801 802   0.50

table(spGen2$weight)
#Returns:
#0.25 0.375   0.5  0.75     1 
#3442   610  6997    12    27 



