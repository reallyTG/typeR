library(echarts4r)


### Name: e_graphic_g
### Title: Graphic
### Aliases: e_graphic_g e_group_g e_image_g e_text_g e_rect_g e_circle_g
###   e_ring_g e_sector_g e_arc_g e_polygon_g e_polyline_g e_line_g
###   e_bezier_curve_g

### ** Examples

# may not work in RStudio viewer
# Open in browser
cars %>% 
  e_charts(speed) %>% 
  e_scatter(dist) %>%
  e_image_g(
    right = 20,
    top = 20,
    z = -999,
    style = list(
      image = "https://www.r-project.org/logo/Rlogo.png",
      width = 150,
      height = 150,
      opacity = .6
    )
  )




