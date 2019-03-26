library(echarts4r)


### Name: e_geo_3d
### Title: Geo 3D
### Aliases: e_geo_3d e_geo_3d_

### ** Examples

choropleth <- data.frame(
  countries = c("France", "Brazil", "China", "Russia", "Canada", "India", "United States",
                "Argentina", "Australia"),
  height = runif(9, 1, 5),
  color = c("#F7FBFF", "#DEEBF7", "#C6DBEF", "#9ECAE1", "#6BAED6", "#4292C6", 
            "#2171B5", "#08519C", "#08306B")
)

choropleth %>% 
  e_charts(countries) %>% 
  e_geo_3d(height, color)
  



