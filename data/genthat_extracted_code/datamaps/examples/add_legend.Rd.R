library(datamaps)


### Name: add_legend
### Title: Add legend
### Aliases: add_legend

### ** Examples

data <- data.frame(name = c("USA", "FRA", "CHN", "RUS", "COG", "DZA"),
    values = c("N. America", "EU", "Asia", "EU", "Africa", "Africa"))

data %>%
    datamaps() %>%
    add_choropleth(name, values, colors = c("skyblue", "yellow", "orangered")) %>%
    add_legend()




