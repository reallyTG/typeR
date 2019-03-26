library(s2dverification)


### Name: Subset
### Title: Subset a Data Array
### Aliases: Subset
### Keywords: dplot

### ** Examples

subset <- Subset(sampleMap$mod, c('dataset', 'sdate', 'ftime'), 
                 list(1, 1, 1), drop = 'selected')
PlotLayout(PlotEquiMap, c('lat', 'lon'), subset, 
           sampleMap$lon, sampleMap$lat, 
           titles = paste('Member', 1:3))



