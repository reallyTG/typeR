library(umx)


### Name: umx_set_plot_file_suffix
### Title: Set output suffix used in umx plot (structural diagrams) files
###   to disk
### Aliases: umx_set_plot_file_suffix

### ** Examples

umx_set_plot_file_suffix() # print current state
old = umx_set_plot_file_suffix(silent = TRUE) # store current value
umx_set_plot_file_suffix("dot")
umx_set_plot_file_suffix("gv")
umx_set_plot_file_suffix(old) # reinstate



