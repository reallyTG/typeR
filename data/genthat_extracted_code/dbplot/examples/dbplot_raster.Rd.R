library(dbplot)


### Name: dbplot_raster
### Title: Raster plot
### Aliases: dbplot_raster

### ** Examples


library(ggplot2)
library(dplyr)

# Returns a 100x100 raster plot of record count of intersections of eruptions and waiting
faithful %>%
  dbplot_raster(eruptions, waiting)

# Returns a 50x50 raster plot of eruption averages of intersections of eruptions and waiting
faithful %>%
  dbplot_raster(eruptions, waiting, fill = mean(eruptions), resolution = 50)




