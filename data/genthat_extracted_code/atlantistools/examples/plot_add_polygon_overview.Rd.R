library(atlantistools)


### Name: plot_add_polygon_overview
### Title: Add spatial representation of polygon layout to a ggplot2
###   object.
### Aliases: plot_add_polygon_overview

### ** Examples

d <- system.file("extdata", "setas-model-new-trunk", package = "atlantistools")
bgm_as_df <- convert_bgm(bgm = file.path(d, "VMPA_setas.bgm"))

p <- plot_line(preprocess$physics, wrap = NULL)
p <- custom_grid(p, grid_x = "polygon", grid_y = "variable")

grob <- plot_add_polygon_overview(p, bgm_as_df)
gridExtra::grid.arrange(grob)



