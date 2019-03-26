library(rcartocolor)


### Name: scale_color_carto_c
### Title: CARTO color scales
### Aliases: scale_color_carto_c scale_color_carto_d scale_colour_carto_c
###   scale_color_carto_c scale_colour_carto_d scale_color_carto_d
###   scale_fill_carto_c scale_fill_carto_d

### ** Examples

library(ggplot2)

ggplot(msleep, aes(vore, sleep_total, fill = vore)) +
        geom_boxplot() +
        scale_fill_carto_d(palette = 6, direction = -1)

## Not run: 
##D # devtools::install_github("tidyverse/ggplot2")
##D library(sf)
##D library(spData)
##D library(ggplot2)
##D ggplot(world, aes(fill = lifeExp)) +
##D         geom_sf(data = world) +
##D         coord_sf(crs = "+proj=robin") +
##D         scale_fill_carto_c(name = "Life expectancy: ",
##D                            type = "diverging", palette = "Fall", direction = -1) +
##D         theme_void()
##D 
##D ggplot(world, aes(fill = region_un)) +
##D         geom_sf(data = world) +
##D         coord_sf(crs = "+proj=robin")  +
##D         scale_fill_carto_d(name = "Region: ", palette = "Prism") +
##D         theme_void()
## End(Not run)



