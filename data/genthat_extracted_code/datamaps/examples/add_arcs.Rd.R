library(datamaps)


### Name: add_arcs
### Title: Add arcs
### Aliases: add_arcs

### ** Examples

states <- data.frame(ori.lon = c(-97.03720, -87.90446),
    ori.lat = c(32.89595, 41.97960),
    des.lon = c(-106.60919, -97.66987),
    des.lat = c(35.04022, 30.19453),
    strokeColor = c("blue", "red"),
    arcSharpness = c(2, 1))

states %>%
    datamaps(scope = "USA", default = "lightgray") %>%
    add_arcs(ori.lon, ori.lat, des.lon, des.lat, strokeColor)




