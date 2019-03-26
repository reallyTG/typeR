library(ar.matrix)


### Name: Q.iid
### Title: Precision matrix for a IID process
### Aliases: Q.iid r.iid

### ** Examples

require("leaflet")
require("sp")

# simulate iid data and attach to spatial polygons data frame
US.df@data$data <- c(r.iid(1, M=nrow(US.graph), sigma=1))

# color palette of data
pal <- colorNumeric(palette="YlGnBu", domain=US.df@data$data)

# see map
map1<-leaflet() %>%
    addProviderTiles("CartoDB.Positron") %>%
    addPolygons(data=US.df, fillColor=~pal(data), color="#b2aeae",
                fillOpacity=0.7, weight=0.3, smoothFactor=0.2) %>%
    addLegend("bottomright", pal=pal, values=US.df$data, title="", opacity=1)
map1




