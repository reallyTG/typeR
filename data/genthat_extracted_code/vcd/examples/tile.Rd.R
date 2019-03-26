library(vcd)


### Name: tile
### Title: Tile Plot
### Aliases: tile tile.default tile.formula
### Keywords: hplot

### ** Examples

data("Titanic")

## default plot
tile(Titanic)
tile(Titanic, type = "expected")
tile(Titanic, shade = TRUE)

## some variations
tile(Titanic, tile_type = "squaredarea")
tile(Titanic, tile_type = "width", squared_tiles = FALSE)
tile(Titanic, tile_type = "height", squared_tiles = FALSE)
tile(Titanic, tile_type = "area", halign = "center", valign = "center")

## repeat levels
tile(Titanic[,,,c(1,2,1,2)])



