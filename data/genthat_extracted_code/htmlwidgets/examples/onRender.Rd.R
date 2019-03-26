library(htmlwidgets)


### Name: onRender
### Title: Execute custom JavaScript code after rendering
### Aliases: onRender

### ** Examples

## Not run: 
##D library(leaflet)
##D 
##D # This example uses browser geolocation. RStudio users:
##D # this won't work in the Viewer pane; try popping it
##D # out into your system web browser.
##D leaflet() %>% addTiles() %>%
##D   onRender("
##D     function(el, x) {
##D       // Navigate the map to the user's location
##D       this.locate({setView: true});
##D     }
##D   ")
##D 
##D 
##D # This example shows how you can make an R data frame available
##D # to your JavaScript code.
##D 
##D meh <- "&#x1F610;";
##D yikes <- "&#x1F628;";
##D 
##D df <- data.frame(
##D   lng = quakes$long,
##D   lat = quakes$lat,
##D   html = ifelse(quakes$mag < 5.5, meh, yikes),
##D   stringsAsFactors = FALSE
##D )
##D 
##D leaflet() %>% addTiles() %>%
##D   fitBounds(min(df$lng), min(df$lat), max(df$lng), max(df$lat)) %>%
##D   onRender("
##D     function(el, x, data) {
##D       for (var i = 0; i < data.lng.length; i++) {
##D         var icon = L.divIcon({className: '', html: data.html[i]});
##D         L.marker([data.lat[i], data.lng[i]], {icon: icon}).addTo(this);
##D       }
##D     }
##D   ", data = df)
## End(Not run)




