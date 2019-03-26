library(maptree)


### Name: map.key
### Title: Draw Key to accompany Map of Groups
### Aliases: map.key
### Keywords: hplot aplot

### ** Examples

  data (oregon.env.vars)

  # key for examples in help(map.groups)
  # range map for American Avocet
  kol <- gray (seq(0.8,0.2,length.out=2))
  map.key (0.2, 0.2, labels=c("absent","present"), pch=106, 
    col=kol, head="key", new=TRUE)
  # distribution of January temperatures
  cuts <- quantile (oregon.env.vars[["jan.temp"]], probs=seq(0,1,1/5))
  kol <- gray (seq(0.8,0.2,length.out=5))
  map.key (0.2, 0.2, labels=as.character(round(cuts,0)), 
    col=kol, sep=0, head="key", new=TRUE)

  # key for example in help file for group.tree
  map.key (0.2, 0.2, labels=as.character(seq(6)), 
    pch=19, head="node", new=TRUE)



