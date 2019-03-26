library(multipanelfigure)


### Name: grob_dimensions
### Title: Convenient Access to 'grob' Dimensions
### Aliases: grob_dimensions figure_width simplegrobheight simplegrobwidth
###   simple_grob_height simple_grob_width figure_height

### ** Examples

# Get dimensions of a grid grob
a_circle <- grid::circleGrob(x = 15, y = 30, r = 15, default.unit = "mm")
figure_height(a_circle)
figure_width(a_circle)

# Use the unit_to arg to convert units
figure_height(a_circle, unit_to = "in")
figure_width(a_circle, unit_to = "cm")

# Get dimensions of a multi-panel figure
figure <- multi_panel_figure(width = 55, height = 55, rows = 2, columns = 2)
figure_height(figure)
figure_width(figure)

# ggsave defaults to measuring dimensions in inches
width <- figure_width(figure, unit_to = "in")
height <- figure_height(figure, unit_to = "in")
tmp_file <- tempfile(fileext = ".png")
ggplot2::ggsave(
  tmp_file, gtable::gtable_show_layout(figure),
  width = width, height = height
)
## No test: 
 # Not testing due to use of external software
utils::browseURL(tmp_file)
## End(No test)



