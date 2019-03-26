library(cartography)


### Name: layoutLayer
### Title: Layout Layer
### Aliases: layoutLayer

### ** Examples

library(sf)
mtq <- st_read(system.file("gpkg/mtq.gpkg", package="cartography"))
plot(st_geometry(mtq), col = "#D1914D", border = "white", bg = "#A6CAE0")
# Layout plot
layoutLayer()

plot(st_geometry(mtq), col = "#D1914D", border = "white", bg = "#A6CAE0")
# Layout plot
layoutLayer(title = "Martinique",
            author =  paste0("cartography ", packageVersion("cartography")),
            tabtitle = TRUE, scale = 5, north = TRUE, frame = FALSE,
            theme = "sand.pal")



