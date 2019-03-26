library(geojsonR)


### Name: FROM_GeoJson
### Title: reads GeoJson data
### Aliases: FROM_GeoJson

### ** Examples


library(geojsonR)


# INPUT IS A FILE

# Do not run

# res = FROM_GeoJson(url_file_string = "/myfolder/feature_collection.geojson")


# INPUT IS A GEOJSON (character string)

tmp_str = '{ "type": "MultiPolygon", "coordinates": [
  [[[102.0, 2.0], [103.0, 2.0], [103.0, 3.0], [102.0, 3.0], [102.0, 2.0]]],
  [[[100.0, 0.0], [101.0, 0.0], [101.0, 1.0], [100.0, 1.0], [100.0, 0.0]],
   [[100.2, 0.2], [100.8, 0.2], [100.8, 0.8], [100.2, 0.8], [100.2, 0.2]]]
  ]
}'

res = FROM_GeoJson(url_file_string = tmp_str)


# INPUT IS A URL

# Do not run

# res = FROM_GeoJson(url_file_string = "http://www.EXAMPLE_web_page.geojson")




