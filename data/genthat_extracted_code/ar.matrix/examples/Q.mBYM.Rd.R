library(ar.matrix)


### Name: Q.mBYM
### Title: Modified Precision matrix for a BYM process
### Aliases: Q.mBYM r.mBYM

### ** Examples


## Not run: 
##D require("leaflet")
##D require("sp")
##D 
##D # simulate mBYM data and attach to spatial polygons data frame
##D US.df@data$data <- c(r.mBYM(1, graph=US.graph, sigma=1, rho=.99))
##D 
##D # color palette of data
##D pal <- colorNumeric(palette="YlGnBu", domain=US.df@data$data)
##D 
##D # see map
##D map1<-leaflet() %>%
##D     addProviderTiles("CartoDB.Positron") %>%
##D     addPolygons(data=US.df, fillColor=~pal(data), color="#b2aeae",
##D                 fillOpacity=0.7, weight=0.3, smoothFactor=0.2) %>%
##D     addLegend("bottomright", pal=pal, values=US.df$data, title="", opacity=1)
##D map1
## End(Not run)




