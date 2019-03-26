library(leafletCN)


### Name: leafletGeo
### Title: Create a sp object from a data.frame
### Aliases: leafletGeo

### ** Examples

if(require(leaflet)){
  dat = data.frame(regionNames("china"),
                                runif(34))
  map = leafletGeo("china", dat)

   pal <- colorNumeric(
     palette = "Blues",
     domain = map$value)

  leaflet(map) %>% addTiles() %>%
     addPolygons(stroke = TRUE,
     smoothFactor = 1,
     fillOpacity = 0.7,
     weight = 1,
     color = ~pal(value),
     popup = ~htmltools::htmlEscape(popup)
     ) %>%
   addLegend("bottomright", pal = pal, values = ~value,
                        title = "legendTitle",
                 labFormat = leaflet::labelFormat(prefix = ""),
                 opacity = 1)
}



