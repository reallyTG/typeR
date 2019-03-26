library(googleway)


### Name: add_fusion
### Title: Add Fusion
### Aliases: add_fusion

### ** Examples

## Not run: 
##D 
##D map_key <- 'your_api_key'
##D 
##D qry <- data.frame(select = 'address',
##D     from = '1d7qpn60tAvG4LEg4jvClZbc1ggp8fIGGvpMGzA',
##D     where = 'ridership > 200')
##D 
##D google_map(key = map_key, location = c(41.8, -87.7), zoom = 9) %>%
##D   add_fusion(query = qry)
##D 
##D 
##D qry <- list(select = 'address',
##D     from = '1d7qpn60tAvG4LEg4jvClZbc1ggp8fIGGvpMGzA',
##D     where = 'ridership > 200')
##D 
##D google_map(key = map_key, location = c(41.8, -87.7), zoom = 9) %>%
##D   add_fusion(query = qry)
##D 
##D qry <- data.frame(select = 'geometry',
##D    from = '1ertEwm-1bMBhpEwHhtNYT47HQ9k2ki_6sRa-UQ')
##D 
##D styles <- list(
##D   list(
##D     polygonOptions = list( fillColor = "#00FF00", fillOpacity = 0.3)
##D     ),
##D   list(
##D     where = "birds > 300",
##D     polygonOptions = list( fillColor = "#0000FF" )
##D     ),
##D   list(
##D     where = "population > 5",
##D     polygonOptions = list( fillOpacity = 1.0 )
##D  )
##D )
##D 
##D google_map(key = map_key, location = c(-25.3, 133), zoom = 4) %>%
##D   add_fusion(query = qry, styles = styles)
##D 
##D qry <- '{"select":"geometry","from":"1ertEwm-1bMBhpEwHhtNYT47HQ9k2ki_6sRa-UQ"}'
##D 
##D styles <- '[
##D   {
##D     "polygonOptions":{
##D       "fillColor":"#FFFF00",
##D       "fillOpacity":0.3
##D       }
##D     },
##D     {
##D       "where":"birds > 300",
##D        "polygonOptions":{
##D          "fillColor":"#000000"
##D        }
##D      },
##D      {
##D        "where":"population > 5",
##D        "polygonOptions":{
##D          "fillOpacity":1
##D          }
##D      }
##D    ]'
##D 
##D google_map(key = map_key, location = c(-25.3, 133), zoom = 4) %>%
##D   add_fusion(query = qry, styles = styles)
##D 
##D ## using a JSON style
##D attr(styles, 'class') <- 'json'
##D 
##D google_map(key = map_key, location = c(-25.3, 133), zoom = 4) %>%
##D   add_fusion(query = qry, styles = styles)
##D 
##D qry <- data.frame(select = 'location',
##D     from = '1xWyeuAhIFK_aED1ikkQEGmR8mINSCJO9Vq-BPQ')
##D 
##D google_map(key = map_key, location = c(0, 0), zoom = 1) %>%
##D   add_fusion(query = qry, heatmap = T)
##D 
## End(Not run)




