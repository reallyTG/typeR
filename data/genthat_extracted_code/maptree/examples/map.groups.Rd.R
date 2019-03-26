library(maptree)


### Name: map.groups
### Title: Map Groups of Observations
### Aliases: map.groups
### Keywords: hplot cluster tree

### ** Examples

  data (oregon.bird.names, oregon.env.vars, oregon.bird.dist)
  data (oregon.border, oregon.grid)

  # range map for American Avocet
  spp <- match ("American avocet", oregon.bird.names[["common.name"]])
  group <- oregon.bird.dist[,spp] + 1
  names(group) <- row.names(oregon.bird.dist)
  kol <- gray (seq(0.8,0.2,length.out=length (table (group))))
  map.groups (oregon.grid, group=group, col=kol)
  lines (oregon.border)

  # distribution of January temperatures
  cuts <- quantile (oregon.env.vars[["jan.temp"]], probs=seq(0,1,1/5))
  group <- cut (oregon.env.vars[["jan.temp"]], cuts, labels=FALSE, 
    include.lowest=TRUE)
  names(group) <- row.names(oregon.env.vars)
  kol <- gray (seq(0.8,0.2,length.out=length (table (group))))
  map.groups (oregon.grid, group=group, col=kol)
  lines (oregon.border)

  # January temperatures using point symbols rather than polygons
  map.groups (oregon.env.vars, group, col=kol, pch=19)
  lines (oregon.border)



