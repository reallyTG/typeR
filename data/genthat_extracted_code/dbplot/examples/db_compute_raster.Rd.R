library(dbplot)


### Name: db_compute_raster
### Title: Aggregates intersections of two variables
### Aliases: db_compute_raster

### ** Examples


library(dplyr)

# Returns a 100x100 grid of record count of intersections of eruptions and waiting
faithful %>%
  db_compute_raster(eruptions, waiting)

# Returns a 50x50 grid of eruption averages of intersections of eruptions and waiting
faithful %>%
  db_compute_raster(eruptions, waiting, fill = mean(eruptions), resolution = 50)




