library(mschart)


### Name: set_theme
### Title: set chart theme
### Aliases: set_theme mschart_theme chart_theme

### ** Examples

library(officer)
mytheme <- mschart_theme(
  axis_title = fp_text(color = "red", font.size = 24, bold = TRUE),
  grid_major_line_y = fp_border(width = 1, color = "orange"),
  axis_ticks_y = fp_border(width = .4, color = "gray") )


my_bc <- ms_barchart(data = browser_data, x = "browser",
                              y = "value", group = "serie")
my_bc <- chart_settings( my_bc, dir="horizontal", grouping="stacked",
                                  gap_width = 150, overlap = 100 )
my_bc <- set_theme(my_bc, mytheme)



my_bc_2 <- ms_barchart(data = browser_data, x = "browser",
                              y = "value", group = "serie")
my_bc_2 <- chart_theme(my_bc_2,
  grid_major_line_y = fp_border(width = .5, color = "cyan") )



