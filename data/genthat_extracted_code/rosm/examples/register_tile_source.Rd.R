library(rosm)


### Name: register_tile_source
### Title: Register Tile Sources
### Aliases: get_default_tile_source register_tile_source
###   set_default_tile_source

### ** Examples

# set the default tile source
set_default_tile_source("stamenbw")

# register a custom tile source
register_tile_source(dark = "http://a.basemaps.cartocdn.com/dark_all/${z}/${x}/${y}.png")

## No test: 
library(prettymapr)
ns <- makebbox(47.2, -59.7, 43.3, -66.4)
prettymap(osm.plot(ns, "dark"))
## End(No test)




