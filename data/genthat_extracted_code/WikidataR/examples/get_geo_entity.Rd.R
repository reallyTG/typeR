library(WikidataR)


### Name: get_geo_entity
### Title: Retrieve geographic information from Wikidata
### Aliases: get_geo_entity

### ** Examples

# All entities
sf_locations <- get_geo_entity("Q62")

# Entities with French, rather than English, names
sf_locations <- get_geo_entity("Q62", language = "fr")

# Entities within 1km
sf_close_locations <- get_geo_entity("Q62", radius = 1)

# Multiple entities
multi_entity <- get_geo_entity(entity = c("Q62", "Q64"))




