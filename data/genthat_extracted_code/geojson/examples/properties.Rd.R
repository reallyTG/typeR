library(geojson)


### Name: properties
### Title: Add or get properties
### Aliases: properties properties_add properties_get

### ** Examples

# add properties
x <- '{ "type": "LineString", "coordinates": [ [100.0, 0.0], [101.0, 1.0] ]}'
(y <- linestring(x))
y %>% feature() %>% properties_add(population = 1000)

## add with a named list already created
x <- '{ "type": "LineString", "coordinates": [ [100.0, 0.0], [101.0, 1.0] ]}'
(y <- linestring(x))
props <- list(population = 1000, temperature = 89, size = 5)
y %>% feature() %>% properties_add(.list = props)

## combination of NSE and .list
x <- '{ "type": "LineString", "coordinates": [ [100.0, 0.0], [101.0, 1.0] ]}'
(y <- linestring(x))
props <- list(population = 1000, temperature = 89, size = 5)
y %>% feature() %>% properties_add(stuff = 4, .list = props)

# features to featurecollection
x <- '{ "type": "Point", "coordinates": [100.0, 0.0] }'
point(x) %>%
  feature() %>%
  featurecollection() %>%
  properties_add(population = 10)

# get property
x <- '{ "type": "LineString", "coordinates": [ [100.0, 0.0], [101.0, 1.0] ]}'
(y <- linestring(x))
x <- y %>% feature() %>% properties_add(population = 1000)
properties_get(x, property = 'population')



