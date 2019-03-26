library(rosm)


### Name: as.tile_source
### Title: Tile Sources
### Aliases: as.tile_source is.tile_source source_from_url_format

### ** Examples

# get builtin tile sources
as.tile_source("osm")

# get custom tile sources
as.tile_source("http://a.basemaps.cartocdn.com/dark_all/${z}/${x}/${y}.png")

# get registered tile sources
register_tile_source(dark = "http://a.basemaps.cartocdn.com/dark_all/${z}/${x}/${y}.png")
as.tile_source("dark")

# create more complex tile sources using source_from_url_format
source_from_url_format("http://a.basemaps.cartocdn.com/dark_all/${z}/${x}/${y}.png",
                       attribution = "Tiles by CartoDB")

# test for tile sources
is.tile_source(as.tile_source("osm"))




