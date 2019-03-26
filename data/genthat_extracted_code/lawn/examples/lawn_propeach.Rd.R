library(lawn)


### Name: lawn_propeach
### Title: Iterate over property objects in any GeoJSON object
### Aliases: lawn_propeach

### ** Examples

x <- "{ type: 'Feature', geometry: null, properties: { foo: 1, bar: 3 } }"

# don't apply any function, identity essentially
lawn_propeach(x)

# appply a function callback
lawn_propeach(x, "z.foo === 1")

lawn_propeach(lawn_data$points_count)

z <- '{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "population": 200,
        "name": "things"
      },
      "geometry": {
        "type": "Point",
        "coordinates": [-112.0372, 46.608058]
      }
    }, {
      "type": "Feature",
      "properties": {
        "population": 600,
        "name": "stuff"
      },
      "geometry": {
        "type": "Point",
        "coordinates": [-112.045955, 46.596264]
      }
    }
    ]
}'
lawn_propeach(z)
lawn_propeach(z, "z.population === 200")
lawn_propeach(z, "z.name === 'stuff'")



