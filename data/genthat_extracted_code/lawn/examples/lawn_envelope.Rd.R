library(lawn)


### Name: lawn_envelope
### Title: Calculate envelope around features
### Aliases: lawn_envelope

### ** Examples

fc <- '{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Location A"
      },
      "geometry": {
        "type": "Point",
        "coordinates": [-75.343, 39.984]
      }
    }, {
      "type": "Feature",
      "properties": {
        "name": "Location B"
      },
      "geometry": {
        "type": "Point",
        "coordinates": [-75.833, 39.284]
      }
    }, {
      "type": "Feature",
      "properties": {
        "name": "Location C"
      },
      "geometry": {
        "type": "Point",
        "coordinates": [-75.534, 39.123]
      }
    }
  ]
}'
lawn_envelope(fc)
## Not run: 
##D fc %>% view
##D lawn_envelope(fc) %>% view
## End(Not run)



