library(descriptr)


### Name: ds_plot_box_group
### Title: Compare distributions
### Aliases: ds_plot_box_group

### ** Examples

mt <- dplyr::select(mtcarz, cyl, disp, mpg)
ds_plot_box_group(mt)
ds_plot_box_group(mtcarz, cyl, gear, mpg)




