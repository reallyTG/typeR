library(datamaps)


### Name: config_geo
### Title: Configure map
### Aliases: config_geo

### ** Examples

data <- data.frame(name = c("USA", "FRA", "CHN", "RUS", "COG", "DZA"),
    values = c("N. America", "EU", "Asia", "EU", "Africa", "Africa"),
    letters = LETTERS[1:6])

data %>%
    datamaps(default = "lightgray") %>%
    add_choropleth(name, values) %>%
    config_geo(hide.antarctica = FALSE,
               border.width = 2,
               border.opacity = 0.6,
               border.color = "gray",
               highlight.border.color = "green",
               highlight.fill.color = "lightgreen")




