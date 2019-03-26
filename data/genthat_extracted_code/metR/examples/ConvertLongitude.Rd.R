library(metR)


### Name: ConvertLongitude
### Title: Converts between longitude conventions
### Aliases: ConvertLongitude

### ** Examples

library(ggplot2)
library(data.table)
data(geopotential)
ggplot(geopotential[date == date[1]], aes(lon, lat, z = gh)) +
    geom_contour(color = "black") +
    geom_contour(aes(x = ConvertLongitude(lon)))

map <- setDT(map_data("world"))
map[, c("lon", "group2") := ConvertLongitude(long, group, from = 180)]

ggplot(map, aes(lon, lat, group = group2)) +
    geom_path()




