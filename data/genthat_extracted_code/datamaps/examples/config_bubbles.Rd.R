library(datamaps)


### Name: config_bubbles
### Title: Configure bubbles
### Aliases: config_bubbles

### ** Examples

coords <- data.frame(city = c("London", "New York", "Beijing", "Sydney"),
                     lon = c(-0.1167218, -73.98002, 116.3883, 151.18518),
                     lat = c(51.49999, 40.74998, 39.92889, -33.92001),
                     values = runif(4, 3, 20))

coords %>%
    datamaps(default = "lightgray") %>%
    add_bubbles(lon, lat, values * 2, values, city) %>%
    config_bubbles(highlight.border.color = "rgba(0, 0, 0, 0.2)",
                   fill.opacity = 0.6,
                   border.width = 0.7,
                   highlight.border.width = 5,
                   highlight.fill.color = "green")




