library(datamaps)


### Name: add_icons
### Title: Add icons
### Aliases: add_icons icons_options

### ** Examples

coords <- data.frame(
  city = c("London", "New York", "Beijing", "Sydney"),
  lon = c(-0.1167218, -73.98002, 116.3883, 151.18518),
  lat = c(51.49999, 40.74998, 39.92889, -33.92001)
)

coords %>% 
  datamaps() %>% 
  add_icons(lon, lat)
                     



