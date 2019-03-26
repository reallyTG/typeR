library(datamaps)


### Name: add_markers
### Title: Add markers
### Aliases: add_markers markers_options

### ** Examples

coords <- data.frame(
  city = c("London", "New York", "Beijing", "Sydney"),
  lon = c(-0.1167218, -73.98002, 116.3883, 151.18518),
  lat = c(51.49999, 40.74998, 39.92889, -33.92001),
  radius = runif(4, 5, 17)
)

icon_url <- paste0(
  "https://pbs.twimg.com/profile_images/",
  "927645314630193158/ufoYTbbi_400x400.jpg"
)

coords %>% 
  datamaps() %>% 
  markers_options(
    icon = list(
      url = icon_url,
      width = 20, height = 20
     ),
     fillOpacity = 1
  ) %>% 
  add_markers(lon, lat)
  



