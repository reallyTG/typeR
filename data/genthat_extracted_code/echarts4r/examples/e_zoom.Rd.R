library(echarts4r)


### Name: e_zoom
### Title: Zoom
### Aliases: e_zoom

### ** Examples

cars %>% 
  e_charts(dist) %>% 
  e_scatter(speed) %>% 
  e_datazoom() %>% 
  e_zoom(
    dataZoomIndex = 0,
    start = 20,
    end = 40,
    btn = "BUTTON"
  ) %>% 
  e_button("BUTTON", "Zoom in")




