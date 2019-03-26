library(descriptr)


### Name: ds_plot_bar_stacked
### Title: Generate stacked bar plots
### Aliases: ds_plot_bar_stacked

### ** Examples

mt <- dplyr::select(mtcarz, cyl, gear, am)
ds_plot_bar_stacked(mt)
ds_plot_bar_stacked(mtcarz, cyl, gear)




