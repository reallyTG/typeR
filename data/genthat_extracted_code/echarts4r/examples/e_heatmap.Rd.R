library(echarts4r)


### Name: e_heatmap
### Title: Heatmap
### Aliases: e_heatmap e_heatmap_

### ** Examples

v <- LETTERS[1:10]
matrix <- data.frame(
  x = sample(v, 300, replace = TRUE), 
  y = sample(v, 300, replace = TRUE), 
  z = rnorm(300, 10, 1),
  stringsAsFactors = FALSE
) %>% 
  dplyr::group_by(x, y) %>% 
  dplyr::summarise(z = sum(z)) %>% 
  dplyr::ungroup()

matrix %>% 
  e_charts(x) %>% 
  e_heatmap(y, z) %>% 
  e_visual_map(z)

# calendar   
dates <- seq.Date(as.Date("2018-01-01"), as.Date("2018-12-31"), by = "day")
values <- rnorm(length(dates), 20, 6)

year <- data.frame(date = dates, values = values)

year %>% 
  e_charts(date) %>% 
  e_calendar(range = "2018") %>% 
  e_heatmap(values, coord.system = "calendar") %>% 
  e_visual_map(max = 30)




