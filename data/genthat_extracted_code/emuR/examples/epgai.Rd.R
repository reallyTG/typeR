library(emuR)


### Name: epgai
### Title: Electropalatographic contact indices
### Aliases: epgai epgci epgdi
### Keywords: math

### ** Examples


#  Anteriority index: trackdata
ai <- epgai(coutts.epg)
#  Dorsopalatal index, one-columned matrix
di <- epgdi(dcut(coutts.epg, 0.5, prop=TRUE))
# Next to examples: Centrality  index, one-columed matrix
ci <- epgci(palate(coutts.epg))
ci <- epgci(palate(dcut(coutts.epg, 0.5, prop=TRUE)))





