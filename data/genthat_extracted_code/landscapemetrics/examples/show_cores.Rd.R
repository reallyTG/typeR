library(landscapemetrics)


### Name: show_cores
### Title: Show core area
### Aliases: show_cores show_cores.RasterLayer show_cores.RasterStack
###   show_cores.RasterBrick show_cores.stars show_cores.list

### ** Examples

# show "global" core area
show_cores(landscape, class = "global", labels = FALSE)

# show the core area of every class as facet
show_cores(landscape, class = "all", labels = FALSE)

# show only the core area of class 1 and 3
show_cores(landscape, class = c(1, 3), labels = TRUE)




