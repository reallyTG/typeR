library(leafletCN)


### Name: geojsonMap
### Title: Load amap to leaflet
### Aliases: geojsonMap

### ** Examples

dat = data.frame(name = regionNames("china"),
                 value = runif(34))
geojsonMap(dat,"china")

dat$value2 = cut(dat$value, c(0, 0.25, 0.5, 1))
geojsonMap(dat,"china",
  namevar = ~name,
  valuevar = ~value2,
  palette="Reds",
  colorMethod="factor")

geojsonMap(dat,"china",
  namevar = ~name,
  valuevar = ~value2,
  palette = topo.colors(3),
  colorMethod="factor")



