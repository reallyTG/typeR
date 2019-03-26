library(mapdeck)


### Name: add_text
### Title: Add Text
### Aliases: add_text

### ** Examples


## No test: 

## You need a valid access token from Mapbox
key <- 'abc'

mapdeck(
  token = key,
  style = mapdeck_style('dark')
) %>%
  add_text(
    data = capitals
    , lon = 'lon'
    , lat = 'lat'
    , fill_colour = 'country'
    , text = 'capital'
    , layer_id = 'text'
  )
## End(No test)




