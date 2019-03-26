library(linkcomm)


### Name: layout.spencer.circle
### Title: Calculate Node Coordinates for a Spencer Circle
### Aliases: layout.spencer.circle

### ** Examples

## Generate graph and extract link communities.
g <- swiss[,3:4]
lc <- getLinkCommunities(g)

## Extract x-y coordinates for nodes in a Spencer circle.
layout.spencer.circle(lc)



