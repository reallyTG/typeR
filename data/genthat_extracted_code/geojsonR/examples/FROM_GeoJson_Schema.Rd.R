library(geojsonR)


### Name: FROM_GeoJson_Schema
### Title: reads GeoJson data using a one-word-schema
### Aliases: FROM_GeoJson_Schema

### ** Examples


library(geojsonR)


# INPUT IS A GEOJSON (character string)

tmp_str = '{
            "name" : "example_name",
            "location" : {
                "type" : "Point",
                "coordinates" : [ -120.24, 39.21 ]
              }
           }'

res = FROM_GeoJson_Schema(url_file_string = tmp_str, geometry_name = "location")




