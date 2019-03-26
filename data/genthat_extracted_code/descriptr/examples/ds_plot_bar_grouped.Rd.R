library(descriptr)


### Name: ds_plot_bar_grouped
### Title: Generate grouped bar plots
### Aliases: ds_plot_bar_grouped

### ** Examples

mt <- dplyr::select(mtcarz, cyl, gear, am)
ds_plot_bar_grouped(mt)
ds_plot_bar_grouped(mtcarz, cyl, gear)




