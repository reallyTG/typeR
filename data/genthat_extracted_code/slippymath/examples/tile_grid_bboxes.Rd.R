library(slippymath)


### Name: tile_grid_bboxes
### Title: tile_grid_bboxes
### Aliases: tile_grid_bboxes

### ** Examples


tibrogargan<- c(xmin = 152.938485, ymin = -26.93345, xmax = 152.956467, 
               ymax = -26.921463)

tibrogargan_grid <- bbox_to_tile_grid(tibrogargan, zoom = 15)

tile_grid_bboxes(tibrogargan_grid)



