library(linkcomm)


### Name: LinkDensities
### Title: Calculate Link Community Link Densities
### Aliases: LinkDensities

### ** Examples

## Generate graph and extract link communities.
g <- swiss[,3:4]
lc <- getLinkCommunities(g)

## Calculate link densities.
ld <- LinkDensities(lc)



