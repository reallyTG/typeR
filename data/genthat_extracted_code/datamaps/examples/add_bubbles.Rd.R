library(datamaps)


### Name: add_bubbles
### Title: Add bubbles
### Aliases: add_bubbles

### ** Examples

coords <- data.frame(city = c("London", "New York", "Beijing", "Sydney"),
                     lon = c(-0.1167218, -73.98002, 116.3883, 151.18518),
                     lat = c(51.49999, 40.74998, 39.92889, -33.92001),
                     values = runif(4, 5, 17))

coords %>%
    datamaps() %>%
    add_bubbles(lon, lat, values * 2, values, city)

data <- data.frame(name = c("USA", "FRA", "CHN", "RUS", "COG", "DZA"),
    color = round(runif(6, 1, 10)))

data %>%
    datamaps(default = "lightgray") %>%
    add_choropleth(name, color) %>%
    add_data(coords) %>%
    add_bubbles(lon, lat, values * 2, values, city, colors = c("red", "blue"))




