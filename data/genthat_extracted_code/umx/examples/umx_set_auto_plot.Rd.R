library(umx)


### Name: umx_set_auto_plot
### Title: umx_set_auto_plot
### Aliases: umx_set_auto_plot

### ** Examples

library(umx)
umx_set_auto_plot() # print current state
old = umx_set_auto_plot(silent = TRUE) # store existing value
umx_set_auto_plot(TRUE)   # set to on (internally stored as "name")
umx_set_auto_plot(FALSE)  # set to off (internally stored as NA)
umx_set_auto_plot(old)    # reinstate



