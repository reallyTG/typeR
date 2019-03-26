library(slippymath)


### Name: bbox_to_tile_grid
### Title: bbox_to_tile_grid
### Aliases: bbox_to_tile_grid

### ** Examples

tibrogargan<- c(xmin = 152.938485, ymin = -26.93345, xmax = 152.956467, 
               ymax = -26.921463)

## Get a grid of the minimum number of tiles for a given zoom.
bbox_to_tile_grid(tibrogargan, zoom = 15)

## get a grid of at most 12 tiles, choosing the most detailed zoom possible.
bbox_to_tile_grid(tibrogargan, max_tiles = 12)



