library(broom)


### Name: tidy.map
### Title: Tidy a(n) map object
### Aliases: tidy.map maps_tidiers

### ** Examples


if (require("maps") && require("ggplot2")) {
    
    library(maps)
    library(ggplot2)

    ca <- map("county", "ca", plot = FALSE, fill = TRUE)
    tidy(ca)
    qplot(long, lat, data = ca, geom = "polygon", group = group)

    tx <- map("county", "texas", plot = FALSE, fill = TRUE)
    tidy(tx)
    qplot(long, lat, data = tx, geom = "polygon", group = group,
          colour = I("white"))
}




