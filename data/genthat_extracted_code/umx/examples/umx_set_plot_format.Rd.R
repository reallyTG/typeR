library(umx)


### Name: umx_set_plot_format
### Title: Set output format of plots (structural diagrams) in umx
### Aliases: umx_set_plot_format

### ** Examples

library(umx)
umx_set_plot_format() # print current state
old = umx_set_plot_format(silent = TRUE) # store current value
umx_set_plot_format("graphviz")
umx_set_plot_format("DiagrammeR")
umx_set_plot_format(old) # reinstate



