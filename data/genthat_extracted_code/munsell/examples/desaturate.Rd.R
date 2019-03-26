library(munsell)


### Name: desaturate
### Title: Make a munsell colour less saturated
### Aliases: desaturate

### ** Examples

desaturate("5PB 2/4")
cols <- c("5PB 2/6", "5Y 7/8")
p <- plot_mnsl(c(cols, desaturate(cols), desaturate(cols, 2)))
p + ggplot2::facet_wrap(~ names, ncol = 2)



